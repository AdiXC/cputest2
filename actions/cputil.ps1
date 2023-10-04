$cpuUtilization = (Get-Counter '\Processor(*)\% Processor Time').CounterSamples | Select-Object -ExpandProperty CookedValue | Average		# Get the current CPU utilization



$top5CpuProcesses = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 5		# Get the top 5 CPU intensive tasks

Write-Host "Current CPU utilization: $cpuUtilization%"
Write-Host "Top 5 CPU intensive tasks:"
foreach ($process in $top5CpuProcesses) {									# Write the results to the console

    Write-Host "$process.Name: $process.CPU%"
}