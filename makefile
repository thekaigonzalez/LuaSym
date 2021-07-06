all:
	gcc luaLib/symlib.c -llua5.4 -llua5.4 -fPIC -shared -lstdc++ -o symblib.so
	gcc systest.c -shared -fPIC -o luasym/stests.so