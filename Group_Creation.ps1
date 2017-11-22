

Function Create_Group {
	param (
		[string] $groupname
)
	gam create group `
	$groupname `
}

Function Make_Distribution_Group {
	param (
		[string] $groupname
	)
		gam update group `
		$groupname `

		allow_external_members `
		FALSE `

		who_can_invite `
		owners_can_invite `

}
