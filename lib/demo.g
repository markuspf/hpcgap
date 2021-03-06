#############################################################################
##
#W  demo.g                      GAP library                     Werner Nickel
##
##
##  This files contains functions that support running demonstrations with
##  Gap.
##


#############################################################################
##
#F  Demonstration( <file> ) . . . . . . . . . . run a demonstration from file
##
if not IsBound(last) then
    last := fail;
fi;
if not IsBound(last2) then
    last2 := fail;
fi;
if not IsBound(last3) then
    last3 := fail;
fi;
if not IsBound(time) then
    time := fail;
fi;


BindGlobal( "Demonstration", function( file )
    local   input,  keyboard,  result, storedtime;

    input := InputTextFile( file );
    while input = fail do
        Error( "Cannot open file ", file );
    od;

    Print( "\nStart of demonstration.\n\n" );

    InputLogTo( "*stdout*" );
    keyboard := InputTextUser();
    Print( "demo> \c" );
    while CHAR_INT( ReadByte( keyboard ) ) <> 'q' do
        storedtime := Runtime();
        result:=READ_COMMAND( input, true ); # Executing the command.
        time := Runtime()-storedtime;
        if result <> SuPeRfail then
            last3 := last2;
            last2 := last;
            last := result;
            View( result);
            Print("\n" );
        fi;

        if IsEndOfStream( input ) then
            break;
        fi;
        Print( "demo> \c" );
    od;
    Print( "\nEnd of demonstration.\n\n" );
    CloseStream( keyboard );
    CloseStream( input );
    InputLogTo();
end );

#############################################################################
##
#F  ReadVerbose( <file> ) . . . . . . . . . . run a demonstration from file
##
BindGlobal( "ReadVerbose", function( file )
local   input,command,exec,result,blank,semic,hash,process,l,view,estream;

    input := InputTextFile( file );
    while input = fail do
        Error( "Cannot open file ", file );
    od;

    blank:=" \n";
    semic:=';';
    hash:='#';
    exec:="";
    process:=function()
        local storedtime;
        view:=true;
        if exec[Length(exec)-1]=semic then
            view:=false;
        fi;
        estream:=InputTextString( exec );
        storedtime := Runtime();
        result:=READ_COMMAND( estream, true ); # Executing the command.
        time := Runtime()-storedtime;
        CloseStream(estream);
        if result<>SuPeRfail then
            last3 := last2;
            last2 := last;
            last := result;
            if view then
               View(result);
                Print("\n");
            fi;
        fi;
        exec:="";
    end;
    command := ReadLine( input );      # Executing the command.
    while not IsEndOfStream(input) do
      if Length(exec)=0 then
        Print("gap> ");
      else
        Print("> ");
      fi;
      Print(command);

      # is there a hash mark anywhere?
      l:=1;
      while l<=Length(command) and command[l]<>hash do
        l:=l+1;
      od;
      l:=l-1;

      # remove trailing blanks
      while l>0 and command[l] in blank do
        l:=l-1;
      od;

      Append(exec,command{[1..l]});
      if l>0 and command[l]=semic then
        process();
      fi;

      command := ReadLine( input );      # Executing the command.
    od;
    CloseStream( input );
    if Length(exec)>0 then
      process();
    fi;
end );


#############################################################################
##
#E

