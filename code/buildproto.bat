
rem �л���.protoЭ�����ڵ�Ŀ¼  
cd proto  
rem ����ǰ�ļ����е�����Э���ļ�ת��Ϊlua�ļ�  
for %%i in (*.proto) do (    
echo %%i  
"..\protoc.exe" --plugin=protoc-gen-lua="..\plugin\protoc-gen-lua.bat" --lua_out=..\lua %%i  
  
)  

cd ../
protoc-gen-lua-tools.exe
rem if exist "./pb" rmdir /s /q "./pb"

rem mkdir "./pb"

rem move *.lua ./pb
rem echo end  
pause