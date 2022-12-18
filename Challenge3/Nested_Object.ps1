function Output($object, [string[]]$keys)
{
$Name = $keys[0]
if($keys.count.Equals(1)){
return $object.$Name
}
else {
return Output -object $object.$Name -key ($keys | Select-Object -Skip 1)
}
}


$Object = Read-Host "Please enter the object" | ConvertFrom-Json
$keys = (Read-Host "Enter the Keys" ).split("/")
Output $Object -key $keys


#{ "A": {"B": {"C": "D" }} }