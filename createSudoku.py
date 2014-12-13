def create(val):
    ans = "Col"+str(val)+" = ["
    for i in range(1,10):
        ans+="S"+str(val)+str(i)+","
    ans = ans[:-1]
    ans+="]"
    return ans

def createEmptyPuzzle():
    ans = "["
    for i in range(81):
        ans+="_,"
    ans = ans[:-1]
    ans+="]"
    return ans
    
def createHTMLTable():
    ans = "<table id=\"Sudoku\" border=\"2\">"
    for i in range(9):
        ans+="<tr>"
        for i in range(9):
            ans+="<td contentEditable='true'>0</td>"
        ans+="</tr>"
    ans+="</table>"
    return ans
    
            