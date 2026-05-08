import sublime
import sublime_plugin
import re

class IndentConsoleOutputCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        # Prompt (línea de comando)
        command_pattern = re.compile(r'^[\w@.-]+:.*[#\$] ')

        # Separadores que cortan indentación
        stop_pattern = re.compile(r'^(-{79}|\.{49}|\+{24})$')

        selections = self.view.sel()

        # 👉 Si no hay selección real → usar todo el documento
        if len(selections) == 1 and selections[0].empty():
            regions = [sublime.Region(0, self.view.size())]
        else:
            regions = selections

        for region in regions:
            text = self.view.substr(region)
            new_lines = []

            indenting = False

            for line in text.splitlines():
                if command_pattern.match(line):
                    indenting = True
                    new_lines.append(line)
                    continue

                if stop_pattern.match(line):
                    indenting = False
                    new_lines.append(line)
                    continue

                if indenting:
                    new_lines.append("\t" + line)
                else:
                    new_lines.append(line)

            self.view.replace(edit, region, "\n".join(new_lines))
