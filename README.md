# demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

https://alltechsavvy.com/must-have-vscode-extensions-for-flutter/

VsCode Extensions
- [Complete Flutter Extension Pack](https://marketplace.visualstudio.com/items?itemName=GulajavaMinistudio.complete-flutter-extension-pack)
- [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
- [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code)
- [Awesome Flutter Snippets](https://marketplace.visualstudio.com/items?itemName=Nash.awesome-flutter-snippets)
- [Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)
- [bloc](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc)
- [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)
- [Color Hightlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight)
- [Error lens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)
- [Flutter Files](https://marketplace.visualstudio.com/items?itemName=gornivv.vscode-flutter-files)
- [image preview](https://marketplace.visualstudio.com/items?itemName=kisstkondoros.vscode-gutter-preview)
- [Material Theme Icons](https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme-icons)
- [pubspec assist](https://marketplace.visualstudio.com/items?itemName=jeroen-meijer.pubspec-assist)
- [TODO Highlights](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight)
- [TODO tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)

- [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
- [Text Marker (Highlighter)](https://marketplace.visualstudio.com/items?itemName=ryu1kn.text-marker)
- [Paste JSON as Code](https://marketplace.visualstudio.com/items?itemName=quicktype.quicktype)
- [GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)

App Icon Generator 
https://appicon.co/

Flutter Basic Tutorial:
https://www.appbrewery.co/courses/851555/lectures/15448377

Important Link :

https://github.com/londonappbrewery/Flutter-Course-Resources/#section-3-i-am-rich---how-to-create-flutter-apps-from-scratch


For Update Path in Mac:
For Update Path
1. Terminal command (vim ~/ .zshrc) / (vim $HOME/.zshrc)
Press (i) - key for Edit
Update Path : (export PATH="$PATH:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin”) (ex : export PATH=$PATH:/Users/prashantprajapati/Development/flutter/bin)
After edit click esc key
Write - (:wq!)

Once finish open new terminal window

Flutter —version

Solution 2:

1. Open terminal. 
2. vim $HOME/.zshrc 
3. Press "I" key for going to insert mode. 
4. add the following line in the opened file: export PATH="$PATH:/YOUR_FLUTTER_DIR/flutter/bin" 
5. Press "Esc" then write :wq! in terminal and press enter to exit vim. 
6. Reopen the terminal and check "flutter doctor" 
Solution 3:

Working on macOS Catalina 10.15.5 (19F101). I have used .zprofile instead of .zhrc
1. Provide Full Disk Access to Terminal by Setting -> Security & Privacy -> Full Disk Access. Add Terminal 
2. If the current terminal uses bash, change to zshell using the below command chsh -s /bin/zsh 
3. In the root directory i.e something like /Users/^YourAccount^ execute the below touch .zprofile vim .zprofile 
4. Press I to enter insert mode. Type the below export PATH=$PATH:/Users/^YourAccount^/^YourPath^/flutter/bin 
5. Save and quit by pressing Esc, then :wq and Enter 
6. Close Terminal and reopen Again. Then try executing flutter command

