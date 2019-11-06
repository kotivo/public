
Profiles
########################################
General
****************************************

.. http:get:: /controllers/(int:controller_id)/profiles/(int:profile_id)

	Retrieves all the profiles registered to this controller - can target a specific profile_id, gets all if module_id is not set

	Here is a list of parameters for the request body:

	:>json int id: Profile id number if not default "away" or "present"
	:>json string label: Name of the profile
	:>json boolean active: Whether or not the proflile is  active or not
	:>json boolean enabled: Whether or not the profile is set enabled or not
	:>json object period: All the DateTime object data
	:>json object period.time: Begin and end hours
	:>json ISO-8601 period.time.begin: When the profile is set active
	:>json ISO-8601 period.time.end: End time when profile is deactivated

	Example response:

	.. code-block:: json

		[
			{
				"id": 1,
				"label": "poissa toimistolta (arki)",
				"active": false,
				"enabled": true,
				"period": {
					"time": {
						"begin": "17:00:00+02:00",
						"end": "09:00:00+02:00"
					}
				},
				"weekdays": [
					1,
					2,
					3,
					4,
 					5
				],
				"metadata": []
			},
			{
				"id": 2,
				"label": "poissa toimistolta (vklp)",
				"active": false,
				"enabled": true,
				"period": {
					"time": {
						"begin": "00:00:00+03:00",
						"end": "00:00:00+03:00"
					}
				},
				"weekdays": [
					6,
					7
				],
				"metadata": []
			}
		]

Away
****************************************

.. http:get:: /controllers/(int:controller_id)/profiles/away

	Get all the data necessary to find out whether the profile is away or not

	:>json boolean away: Whether the profile is active or not
	:>json ISO-8601 period.time.begin: When the profile is set active
	:>json ISO-8601 period.time.end: When the profile is deactivated

	Example response:

	.. code-block:: json

		{
			"away": false,
			"begin": null,
			"end": null
		}

.. http:put:: /controllers/(int:controller_id)/profiles/away

	Writes values for this controllers away profile - can target a specific controller_id

	Here is a list of parameters for the request body:

	:<json boolean away: Whether this profile is active or not
	:<json ISO-8601 period.time.begin: When the profile is set active
	:<json ISO-8601 period.time.end: When the profile is deactivated

	Example request body:

	Maybe begin/end should be the full DATETIME object???

	.. code-block:: json

		{
			"away": true,
			"begin": "15:00:00+02:00",
			"end": "15:30:00+02:00"
		}