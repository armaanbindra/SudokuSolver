<?php
//$myfile = fopen("input.txt", "r") or die("Unable to open file!");

$myfile = fopen("final.pl", "w") or die("Unable to open file!");


$handle = fopen("template.txt", "r");
if ($handle) {
    while (($line = fgets($handle)) !== false) {
        // process the line read
        //echo $line;
        fwrite($myfile, $line);
        //$fwrite($myfile,"aa");
    }
} else {
    // error opening the file.
} 

//fclose($myfile);
fclose($handle);
//fclose($myfile);


$puzzle  = $_POST["sudokuPuzzle"];

$decodedText = html_entity_decode($_POST["sudokuPuzzle"]);
$num = json_decode($decodedText, true);
$arrlength = count($num);


fwrite($myfile,"\npuzzle(");
fwrite($myfile,$puzzle);
fwrite($myfile,").");

fclose($myfile);

$command = "/usr/local/bin/gprolog --init-goal '[final],halt'";
$result = "";
exec($command);
$result = file_get_contents("output.txt");
$result = str_replace('[','',$result);
$result = str_replace(']','',$result);
echo $result;

?>