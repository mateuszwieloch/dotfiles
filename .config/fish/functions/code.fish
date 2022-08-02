# By default jump to line number provided to the code command
# e.g. code file.txt:73:4  will open the file and jump to line 73, column 4
function code --wraps code --description='alias code --goto'
  command code --goto $argv
end
