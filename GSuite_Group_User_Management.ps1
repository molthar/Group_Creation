$today = $(Get-Date -Format yyyy-MM-dd_hhmmss)
$transcript = "\\cui.edu\files\IT_Services\Adjunct_GAM\Gam_Logs\adjunct_update_$today.txt"
$csv = "\\cui.edu\files\IT_Services\Adjunct_GAM\adjuncts.csv"
$group_id = "adjuncts@cui.edu"
$user_id = "~EMAIL"


<#
	Starts a transcript
#>
# Start-Transcript -path $transcript


<#
	Removes all members from the specified G Suite Group (by role)
	NOTE: Must specify role as:
	  - owner
	  - manager
	  - member

	ex) remove_members -group_id $group_id -role member
#>
function remove_members {
	param (
		[string] $group_id,
		[string] $role_id
	)
    gam update group $group_id clear $role_id
	Write-Host
	Write-Host
}


<#
	Prints a list of current members

	ex) get_group_members -group_id $group_id
#>
function get_group_members {
	param (
		[string] $group_id
	)
    gam print group-members group $group_id membernames
	Write-Host
	Write-Host
}


<#
	Adds member(s) to the group.
	NOTE: Must specify role as:
	  - owner
	  - manager
	  - member

	ex) add_group_members -group_id $group_id -role_id member -user_id $user_id
#>
function add_group_members {
	param (
		[string] $group_id,
		[string] $role_id,
		[string] $user_id
	)
    gam update group $group_id add $role_id user $user_id
	Write-Host
	Write-Host
}


<#
	Adds all users in the csv at the path specified to the group
	NOTE: Must specify role as:
	  - owner
	  - manager
	  - member

	ex) add_members -csv $csv -group_id $group_id -role_id member -user_id $user_id
#>
function add_members {
	param (
		[string] $csv,
		[string] $group_id,
		[string] $role_id,
		[string] $user_id
	)
    gam csv $csv gam update group $group_id add $role_id user $user_id
	Write-Host
	Write-Host
}


function default_adjuncts_members {
	add_group_members -group_id $group_id -role_id owner -user_id its@cui.edu
	add_group_members -group_id $group_id -role_id manager -user_id peter.senkbeil@cui.edu
	add_group_members -group_id $group_id -role_id manager -user_id lorena.bradley@cui.edu
}


# remove_members -group_id $group_id -role_id member
# add_members -csv $csv -group_id $group_id -role_id member -user_id $user_id


# Stop-Transcript
