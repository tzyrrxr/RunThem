;Menu, Tray, NoIcon
CoordMode, ToolTip, Screen
function:
	msgbox, 4099,%A_ScriptName% | Open & close, Yes > Open`nNo > Close
	ifmsgbox, yes ;>> open window
	{
		count := 0
		maxIndex := par.MaxIndex()
		notOpen := []
		For index in par{
			For key, value in par[index]{
				if(key=="path"){
					path := value
				}
				else{
					title := value
					if !WinExist(title){
						;run,%path%, ,Min
						run,%path%
						count += 1
						tooltip, Opening %count%/%maxIndex%, , ,1
					}
					else{
						notOpen.Push(index)
					}
				}

			}
		}
		rememberNotOpen := "No opening:`n"
		for index, value in notOpen{
			if(index == notOpen.MaxIndex()){
				temp = [%value%] 
			}
			else{
				temp = [%value%], 
			}
			rememberNotOpen .=temp
		}
		if(count != par.MaxIndex() && count != 0){
			tooltip, Opening:`n[%count%/%maxIndex%]`n%rememberNotOpen%,0,0,2
		}
		else if(count == 0){
			tooltip, All opened,0,0,2
			sleep, 1000
			return
		}
		else{
			return
		}
		tooltip, , , ,1
		sleep, 10000
		return
	}
	else ifmsgbox, No ;>> close window
	{
		loop, 2
		{
			count := 0
			maxIndex := par.MaxIndex()
			For index in par{
				For key, value in par[index]{
					if(key=="path"){
						path := value
					}
					else{
						title := value
						if WinExist(title){
							count += 1
							tooltip, Closing %count%/%maxIndex%
						}
						WinClose, %title%
					}

				}
			}
			sleep, 200
			tooltip, 
		}
	}
	return
