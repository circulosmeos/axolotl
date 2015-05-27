# 20140108: 
#   Idea extracted from http://www.sublimetext.com/forum/viewtopic.php?f=2&t=4947
#   for inserting the actual date on any document in an easy way.
#   (see also actual user keymap)
# 20140113 circulosmeos: 
#   Supress selection on created text.
# 20140120 circulosmeos: 
#   class towebu_circulosmeos_vanish_selection
#   towebu code modified using class towebu_circulosmeos_grouped_code
import sublime
import sublime_plugin
import time

date_format     = "%Y%m%d"              # 20131002
time_format     = "%H:%M:%S"            # 10:24:01
stamp_format    = "%y%m%d%H%M%S"        # 131002102355
version_format  = "v%Y.%m.%d.%H.%M.%S"  # v2013.10.02.10.23.52
version_pattern = "v[0-9]{4}\.[0-9]{2}\.[0-9]{2}\.[0-9]{2}\.[0-9]{2}\.[0-9]{2}"

class towebu_circulosmeos_vanish_selection():
    """Supress selection on created text."""
    def run(self,cursor_point):
        pt=self.view.text_point( 0 , self.view.sel()[0].begin()+cursor_point )
        self.view.sel().clear()
        self.view.sel().add(sublime.Region(pt))
        self.view.show(pt)

class towebu_circulosmeos_grouped_code():
    """Group code from three functions, as it's repeated."""
    def run(self,edit,string):
        sels = self.view.sel()
        for sel in sels:
            self.view.replace(edit, sel, string);
        towebu_circulosmeos_vanish_selection.run( self, len(string) )

class towebu_insert_versionCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        string=time.strftime(version_format)
        sels = self.view.sel()
        for sel in sels:
            if not self.view.find_all(version_pattern):
                self.view.replace(edit, sel, string);
                return
            region = sublime.Region(0, self.view.size())
            results = self.view.find_all(version_pattern)
            for result in results:
                self.view.replace(edit, result, string)
        towebu_circulosmeos_vanish_selection.run( self, len(string) )
        
class towebu_insert_stampCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        string=time.strftime(stamp_format)
        towebu_circulosmeos_grouped_code.run( self, edit, string)
        
class towebu_insert_dateCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        string=time.strftime(date_format)
        towebu_circulosmeos_grouped_code.run( self, edit, string)
        
class towebu_insert_timeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        string=time.strftime(time_format)
        towebu_circulosmeos_grouped_code.run( self, edit, string)
        
