axolotl
=======

Minimum and efficient  documentation system for sysadmins.

**ax**oltl   
d**O**cumentation   
**L**ibre, organized and   
**T**agged 
in p**L**ain text

Document example
================

![](https://circulosmeos.files.wordpress.com/2015/03/axolotl_example_extract.png)

Usually, I create a document per day for common tasks, with name format YYYYMMDD.txt.
But also separate files with tasks names can be created.

See [http://wp.me/p2FmmK-7E](https://circulosmeos.wordpress.com/2015/03/04/axolotl-a-simple-plain-text-documentation-system/).

You can also download the project and open this page on your browser in order to take a glimpse of a documentation text file as seen by an axolotl "properly instructed" editor: "axolotl doc.html"

Brief Description
=================

Plain text is in most cases an enough documentation approach to any activity.

Only some minimum conventions are required to create metadata and visual clues, both visually enhanced by the text editor. 

Date convention is **YYYYMMDD** ([ISO 8601](http://en.wikipedia.org/wiki/ISO_8601#Calendar_dates) Calendar dates in *basic format*).

Files are stored with the date of the day as name in format YYYYMMDD.txt

This way an efficient and quick documentation system is developed with these features:
* quick and productive documentation of tasks 
* searchs by keywords
* visual clues to documentation
* a standard way for documentation interchange (common keywords, date and author conventions)

See [http://wp.me/p2FmmK-7E](https://circulosmeos.wordpress.com/2015/03/04/axolotl-a-simple-plain-text-documentation-system/) for more details.

Installation
============

Files for both keybindings and color highlighting are presented, for these editors:

* [Editplus 3](https://github.com/circulosmeos/axolotl/tree/master/Editplus%203)
* [Jota Text Editor](https://github.com/circulosmeos/axolotl/tree/master/Jota%20Text%20Editor) (for Android)
* [Sublime Text 3](https://github.com/circulosmeos/axolotl/tree/master/Sublime%20Text%203)

Description of the documentation system
=======================================

Plain text (UTF-8) is (usually) enough for any documentation activity.

These marks, keybindings and color highlighting are used with the help of the text editor:

* names between double brackets represent metadata **tags** (highlighted as green color)   

    **[[circulosmeos]] [[20141127]] [[ntfs]] [[incident]]**   

  The beginning of the metadata line is a heading specifying author (initials or alias) and date: 

    **[[circulosmeos]] [[20141127]]**   

  *Alt+2* keybind automatically creates this author+date heading. 
  NOTE: if you use the code for Sublime Text, change your name in "circulosmeos Insert Preformatted Texts.py", by replacing the text "place your name here!".
  *Alt+6* inserts [[]] with the cursor between the brackets.   
  *F5* inserts actual date in ISO 8601 basic format.   
Next tags are keywords of that specific task.   
This way, it is possible to search by keywords in the documentation.   
In common environments, just 20 to 50 keywords are needed to tag every task in the whole documentation historic archive.   


* repeated characters are used as dividers between different parts of the document or to enclose certain blocks:
	* task divider: 79x '-' (cranberry color) (*Alt+1*)    

	 -------------------------------------------------------------------------------   

* 
	* activity divider inside a task: 49x '.' (yellow color) (*Alt+3*)   

	.................................................   

* 
	* divider that opens and closes a literal block of text: 24x '+' (yellow color) (*Alt+4*)   

	++++++++++++++++++++++++   
	++++++++++++++++++++++++   

* paths or hints are indicated between **<** and **>** in order to mark external or attached resources (yellow color) (*Alt+8*)    

	&lt;screen capture of my error.png&gt;, &lt;https://github.com/circulosmeos/axolotl&gt;   

* links between parts of the document can be indicated using this tag convention for the link:   

	&lt;#link text&gt;   

and the *destination* of the link marked with the same text and a colon prefix:   

	:&lt;#link text&gt;

* visually striking sets for some common tasks, which are repeated (these can be easily found using Sublime's minimap):  
(((DOCUMENTATION_PENDING)))   
(((DOCUMENTATION_PENDING)))   
(((DOCUMENTATION_PENDING)))   
*Alt+5* for one line of this.   
--- PENDING ------ PENDING ------ PENDING ------ PENDING ---   
--- PENDING ------ PENDING ------ PENDING ------ PENDING ---   
--- PENDING ------ PENDING ------ PENDING ------ PENDING ---   
*Alt+7* for one line of this.

Statistics script
=================

The script *axolotl.statisctics.gource.pl* allows for a quick extraction of statistics based on tags: among others,
the percentage of time dedicated to each tag, based on the length of lines employed documenting to each of them.   
See [this post for more details](https://circulosmeos.wordpress.com/2017/01/15/axolotl-statistics-script-and-gource-animation).

	$ ./axolotl.statisctics.gource.pl <directory containing axolotl text files>

The directory must contain files with name conform to *YYYYMMDD.txt* ([ISO 8601 basic format](https://en.wikipedia.org/wiki/ISO_8601#Calendar_dates)).   
The script generates statistics to stdout and a file called *axolotl.gource.log* which can be used as input to [gource](http://gource.io/). This log divides tasks in a tree of years as main branches and months as secondary branches. Colours will identify the different tags.   

![](https://circulosmeos.files.wordpress.com/2017/01/axolotl-statistics-gource-mp4.png)

Note that in order to correctly identify the tags that represent authors, these strings must be indicated in the script at this line, for example with:   

    my @AUTHORS=('author1', 'author2');

which will match axolotl tags [[author1]] and [[author2]]. Note that axolotl tags are case insensitive, so [[AUTHOR1]] would also match as a recognized author (the same as its lowercase counterpart).

An example of statistics output (to stdout) from the script:

    Years comprised:        10
    Days comprised:         1503 files, 1616 different days identified
    Tasks found:            3591
    Total number of lines:  297864
    Different tags found:   1839

    #tags %weighted %tasks lines  tag
    1136  33.9%     30.7%  104858 anonymized_task_1333
    253   10.6%     6.8%    32779 anonymized_task_234
    99    8.2%      2.7%    25200 anonymized_task_3
    260   7.3%      7.0%    22442 anonymized_task1_22
    159   6.8%      4.3%    21077 anonymized_task1_139
    ...

License
=======

Distributed [under GPL 3](http://www.gnu.org/licenses/gpl-3.0.html)
