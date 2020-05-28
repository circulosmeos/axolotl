# 20140113: circulosmeos: 
#   print documentation clues as needed by axolotl convention.
# 20140120: circulosmeos: 
#   code simplification.
import sublime
import sublime_plugin
import time

class circulosmeos_grouped_code():
    def run(self,edit,string,cursor_point=None):
        if cursor_point is None:
            cursor_point=len(string)
        sels = self.view.sel()
        for sel in sels:
            self.view.replace(edit, sel, string);
        circulosmeos_grouped_code.circulosmeos_vanish_selection( self, cursor_point )
    
    def circulosmeos_vanish_selection(self, cursor_point):
        """Supress selection on created text."""
        pt=self.view.text_point( 0 , self.view.sel()[0].begin()+cursor_point )
        self.view.sel().clear()
        self.view.sel().add(sublime.Region(pt))
        self.view.show(pt)


class circulosmeos_insert_80charsline(sublime_plugin.TextCommand):
    def run(self, edit):
        circulosmeos_grouped_code.run( self, edit, 
            '-'*79 + '\n'
            )

class circulosmeos_insert_50charsline(sublime_plugin.TextCommand):
    def run(self, edit):
        circulosmeos_grouped_code.run( self, edit, 
            '.'*49 + '\n'
            )

class circulosmeos_insert_30charsline(sublime_plugin.TextCommand):
    def run(self, edit):
        circulosmeos_grouped_code.run( self, edit, 
            '+'*24 + '\n'
            )

class circulosmeos_insert_author_header(sublime_plugin.TextCommand):
    def run(self, edit):
        circulosmeos_grouped_code.run( self, edit, 
            '[[place your name here!]] [[' + time.strftime("%Y%m%d")  + ']] '
            )

class circulosmeos_insert_doc_todo(sublime_plugin.TextCommand):
    def run(self, edit):
        circulosmeos_grouped_code.run( self, edit, 
            '(((DOCUMENTATION_PENDING))) \n'
            )

class circulosmeos_insert_keyword_marker(sublime_plugin.TextCommand):
    def run(self, edit):
        circulosmeos_grouped_code.run( self, edit, 
            '[[]] ', 
            2 )

class circulosmeos_insert_todo_marker(sublime_plugin.TextCommand):
    def run(self, edit):
        circulosmeos_grouped_code.run( self, edit, 
            "--- PENDING ---"*4 + '\n'
            )
        
class circulosmeos_insert_resource_marker(sublime_plugin.TextCommand):
    def run(self, edit):
        circulosmeos_grouped_code.run( self, edit, 
            '<> ', 
            1 )
        
class circulosmeos_insert_resource_anchor_marker(sublime_plugin.TextCommand):
    def run(self, edit):
        circulosmeos_grouped_code.run( self, edit, 
            ':<#> ', 
            3 )