#----------------------------------
#settings 
#----------------------------------
#履歴の保存
set history save on
set history size 10000
set history filename ~/.gdb_history

#確認をしない   
set confirm off 

#構造体を表示するのにインデントして表示するようにする
set print pretty on  
set print static-members off

#表示する配列数を制限なしにする
set print elements 0 

#gdbが一時停止しないように必要
set height 0
set width 0

#listコマンドの表示行数
set listsize 40

#-----------------------------------  
#key bined
#----------------------------------- 

#local変数を表示
define il 
	info locals 
end

#displayの表示
define id
	info display
end

#breakpointのいちを表示
define ib
	info breakpoints
end

#開始
define st
	start
end

#リスタート
define rs
	kill
	run
end

#argvの表示
define argv
	show args
end

#stackの表示
define stack
	info stack
end

