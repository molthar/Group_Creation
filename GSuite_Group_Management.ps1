

Function Create_Group {
	param (
		[string] $groupname
)
	gam create group `
	$groupname `
}

Function add_manager {
	param (
		[string] $groupname,
		[string] $manager_email
)
	gam update group `
	$groupname add manager `
	$manager_email
}

Function Make_Distribution_Group {
	param (
	[string] $groupname
	)
	gam update group `
	$groupname `
	allow_external_members `
	FALSE `
	, `
	who_can_invite `
	none_can_invite `
	, `
	who_can_join `
	invited_can_join `
	, `
	who_can_post_message `
	all_managers_can_post`
	, `
	who_can_view_membership `
	all_managers_can_view `
	, `
	reply_to `
	reply_to_sender `
	, `
	memebers_can_post_as_the_group `
	FALSE `
	, `
	include_in_global_address_list `
	FALSE `
	, `
	who_can_leave_group `
	none_can_leave `
	, `
	who_can_contact_owner `
	all_managers_can_contact `
	, `
	who_can_view_group `
	all_managers_can_view `
}
