function InfoMetaData($resource)
{

$metadata = Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Proxy $Null -Uri "http://169.254.169.254/metadata/$($resource)?api-version=2021-01-01"
$metadata | ConvertTo-Json -Depth 64
}

$Resource= Read-Host "Enter the resource you want metadata for"
InfoMetaData $Resource