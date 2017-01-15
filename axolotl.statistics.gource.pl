#!/usr/bin/perl -w
#
# extract statistics from axolotl text documents,
# and also form a log file suitable for composing a Gource video
#
# v1.0 circulosmeos, 20091220
# v2.0 circulosmeos, 20170114
#
use strict;
use File::Find;
use File::Basename;
use Time::Local 'timelocal';
use Text::Table;

# files to look for
my $FILES_PATTERN='^((20[\d]{2})[\d]{4})\.txt$'; # regexp without terminating symbols

# directory where to find the files
my $DIRECTORY=$ARGV[0];

# output log file suitable for composing a Gource video:
my $LOG_FILE='axolotl.gource.log';

my $TEST=0; # 1: print verbose actions; 0: normal behaviour

# identify tags that represents authors:
my @AUTHORS=(); #my @AUTHORS=('author1', 'author2'); 
my $DEFAULT_AUTHOR='AUTHOR';

# end of configuration


# .................................................

# convert array to hash for ease of use
my %AUTHORS = map { uc($_) => 1 } @AUTHORS;

# needed variables
my (@FILE_LIST, $file, $task_counter, 
	$weight, @weight, %tags, %weighted_tasks,
	$total_weight,
	%days, $tag, $tag_counter, $line, %years,
	%global_tasks, %global_author, 
	%actual_dates, %actual_tasks, %actual_author, $log_line);

# check passed variables
if ( !defined $DIRECTORY || $DIRECTORY=~/^ *$/ ) {
	die "Use:\n$0 DIRECTORY\n";
}
$FILES_PATTERN='/'.$FILES_PATTERN.'/';

# list all files that conform to pattern $FILES_PATTERN
find(\&filter_FILE_LIST, $DIRECTORY);

$task_counter=$tag_counter=0;
%years=();
$weight=0;
@weight=();
$total_weight=0;

foreach $file (@FILE_LIST) {

	print $file.", " if $TEST==1;

	open fFile, '<', $file || die "$!\n";

	foreach (<fFile>) {

		###chomp;
		$weight++;

		# if this is the beggining of a tag marker:
		if (/^\[\[.+\]\]/) {
			$task_counter++;
			$line=$_;
			%actual_tasks=%actual_dates=%actual_author=();

			# adjust the value of tags, weighted with the number of lines
			# used in their documentation:
			&weight_tags;

			# just in case tasks do not include date, but file name (in fact always) does:
			if ($file=~/^.*\/?((20[\d]{2})[\d]{4})\.txt/) {
				# count days:
				if (!defined $days{$1}) {
					$days{$1}=1;
					# identify year at the same time than days:
					$years{$2}++;
				}
				$actual_dates{$1}=1;
			}

			# count found tags:
			while ($line=~/\[\[([^\]]+)\]\](.*)/) {
				$tag=lc $1;
				$line=$2;
				$tag=lc $tag; # upper & lower case doesn't matter in tags
				if (defined $AUTHORS{uc($tag)}) { # uc() is just a beauty option
					$actual_author{uc($tag)}=1;
					next; # nothing more to do with this tag
				}
				if ($tag!~/^((20[\d]{2})[\d]{4})$/) {
					$tags{$tag}++;
					# and weight it at the end of this 'tag':
					push @weight, $tag;
					$actual_tasks{$tag}=1;
				} else {
					# count days:
					if (!defined $days{$1}) {
						$days{$1}=1;
						# identify year at the same time than days:
						$years{$2}++;
					}
					$actual_dates{$1}=1;
				}
			}

			$actual_author{$DEFAULT_AUTHOR}=1;

			# build now a global hash of tasks with day+task id's
			# in order to indentify tasks repeated the same day (in this or other files)
			# which will be MODIFICATIONS (|M|), not ADDITIONS (|A|), in the log file
			foreach my $global_date (keys %actual_dates) {
				foreach my $global_task (keys %actual_tasks) {
					$global_tasks{$global_date.$global_task}+=1;
					foreach my $global_author (keys %actual_author) {
						$global_author{$global_date.$global_task}{$global_author}=1;
					}
				}
			}

		} # end if (/^\[\[.+\]\]/)

	}

	# at the end of the file the task also finishes, so it must be weighted now:
	&weight_tags;
	close fFile;
}


# .................................................


# open log file:
open fLog, '>', $LOG_FILE || die "$!\n";

# generate gource log line(s):
# unix_timestamp|Author|{A,M,D}|file_path
$log_line='';
foreach my $global_task (sort keys %global_tasks) {
	my $date=substr($global_task,0,8);
	my $task=substr($global_task,8);
	# extract first author: if there're more, they'll be added later
	my $author=(keys %{$global_author{$global_task}})[0];
	$line='';
	# unix timestamp:
	if ($date=~/^(20[\d]{2})([\d]{2})([\d]{2})$/) {
		$line.=timelocal(0, 0, 0, $3, $2-1, $1).'|'.$author;
	} else {
		print "Date error \@$date, $task\n"; # if $TEST==1;
		next;
	}
	$line.='|A';
	# 'faked' file path to colourize the circle with a different colour for each different task 
	# and to separate task by years and months
	#$line.="|$1/$2/$date.$task\n";
	$line.="|$1/$2/.$task\n";
	$log_line.=$line;
	# A|M
	$line=~s#\|A\|#\|M\|#;
	# multiple authors
	if (scalar(keys %{$global_author{$global_task}})>0) {
		foreach (keys %{$global_author{$global_task}}) {
			next if $_ eq $author;
			my $line2=$line;
			$line2=~s#\|$author\|#\|$_\|#;
			$log_line.=$line2;
			if ($global_tasks{$global_task}>1) {
				foreach (2..$global_tasks{$global_task}) {
					$log_line.=$line;
				}
			}			
		}
	} else {
		if ($global_tasks{$global_task}>1) {
			foreach (2..$global_tasks{$global_task}) {
				$log_line.=$line;
			}
		}
	}
}
print fLog $log_line;

close fLog;


# .................................................


print "Years comprised: \t".(keys %years)." ";
foreach (sort keys %years) {
	print "($_,$years{$_}d) ";
}
print "\n";
print "Days comprised: \t$#FILE_LIST files, ".(keys %days)." different days identified\n";
print "Tasks found: \t\t$task_counter\n";
print "Total number of lines: \t$total_weight\n";

print "Different tags found: \t".(keys %tags)."\n\n";

my $table = Text::Table->new(
    "#tags", "%weighted", "%tasks", "lines", "tag"
);

my @table;

foreach my $value (sort {$weighted_tasks{$b} <=> $weighted_tasks{$a} }
		   keys %tags)	{
	push @table, [  
					$tags{$value},
					sprintf("%.1f",$weighted_tasks{$value}/$total_weight*100).'%',
					sprintf("%.1f",$tags{$value}/$task_counter*100).'%',
					$weighted_tasks{$value},
					$value
					];
}

$table->load(@table);

print $table;

exit(0);


# .................................................


sub filter_FILE_LIST() {
   my $fpath=$File::Find::name;
   my $fname=basename($fpath);
   if (eval('$fname=~'.$FILES_PATTERN) && $fname ne '.' && $fname ne '..') {
	   push @FILE_LIST, $fpath;
   }
}


sub weight_tags() {
	# adjust the value of tags, weighted with the number of lines
	# used in their documentation:
	foreach (@weight) { # there're tags to weight
		$weighted_tasks{$_}+=$weight;
	} 
	$total_weight+=$weight;
	@weight=();
	$weight=0;
}