require('symblib')


--- lets go!!!
function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end
print("Welcome to the LuaSym Project.")
print("You can search symbols by typing a file, then the name of the symbol.")
print("Exiting the session using \"exit\" cancels the file search.")

fs = io.read()
function split (inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end
print("Loading file")

if file_exists(fs) then
    while (true) do
        print("active file: " .. fs)
        print("begin typing entry points.")
        io.write("> ")

        local entry = io.read()
        local strarr = split(entry, " ")
        if entry == "exit" then
            os.exit()
        elseif entry == "evaluate-lua-code" then
           print("use ONE lua statement below:")
            io.write(">>> ")
            local sta = io.read()
            local func = load(sta)
            func()

        else
            regisym(fs, entry)
        end
    end
end


