Rules
########################################
General
****************************************

.. http:get:: /controllers/(int:controller_id)/modules/(int:device_id)/rules/(int:profile_id)

	Gets all the rules for certain device_id and profile_id - gets all if profile_id is not given

	:>json string id: Name of the rule - int if self made rule
	:>json float temperature: Target temperature for this rule
	:>json array metadata: All the misc. data

	Example response:

	.. code-block:: json

		{
			"id": "present",
			"temperature": 23,
			"metadata": []
		}

	**TYPE4**

	:>json object type4: All the ASHP data
	:>json boolean type4.on: Whether the ASHP is on in this rule or not
	:>json string type4.mode: 
		Which mode is selected for this rule:

		* hot
		* cold
		* dry
		* fan
		* auto

	:>json string type4.fan:
		Fan speed in percentages - percentage steps differ by ASHP model:

		* auto
		* 0
		* 33
		* 66
		* 100

	:>json object swing: Flap swing direction data
	:>json string swing.horizontal: Flap percentage horizontally
	:>json string swing.vertical: Flap percentage vertically

	**TYPE 6 and 7**

	:>json object switch: Smart switch status
	:>json object switch.on: Whether the switch is on or not

	Example response:

	.. code-block:: json

		[
			{
				"id": "present",
				"temperature": 18,
				"metadata": [],
				"type4": {
					"on": true,
					"mode": "hot",
					"fan": "auto",
					"swing": {
						"horizontal": null,
						"vertical": "100"
					}
				}
			},
			{
				"id": "away",
				"temperature": 15,
				"metadata": [],
				"type4": {
					"on": false,
					"mode": "auto",
					"fan": "auto",
					"swing": {
						"horizontal": null,
						"vertical": "auto"
					}
				}
			},
			{
				"id": 2,
				"temperature": 15,
				"metadata": [],
				"type4": {
					"on": false,
					"mode": "hot",
					"fan": "auto",
					"swing": {
						"horizontal": null,
						"vertical": "100"
					}
				}
			},
			{
				"id": 1,
				"temperature": 15,
				"metadata": [],
				"type4": {
					"on": false,
					"mode": "hot",
					"fan": "66",
					"swing": {
						"horizontal": null,
						"vertical": "100"
					}
				}
			}
		]

.. http:put:: /controllers/(int:controller_id)/modules/(int:device_id)/rules/(int:profile_id)

	Changes data in the selected rule - (int:controller_id), (int:device_id) and (int:profile_id) are required ???? why the profile id is checked as optional in tool ????

	:<json int id: Id of the rule - string if "present" or "away"
	:<json float temperature: Target temperature for the chosen rule
	:<json array metadata: Misc. data

	Example request body:

	.. code-block:: json

		{
			"id": "present",
			"temperature": 23,
			"metadata": []
		}

	**TYPE4**

	:<json object type4: All the ASHP data
	:<json boolean type4.on: Whether the ASHP is on in this rule or not
	:<json string type4.mode: 
		Which mode is selected for this rule:

		* hot
		* cold
		* dry
		* fan
		* auto

	:<json string type4.fan:
		Fan speed in percentages - percentage steps differ by ASHP model:

		* auto
		* 0
		* 33
		* 66
		* 100

	:<json object swing: Flap swing direction data
	:<json string swing.horizontal: Flap percentage horizontally
	:<json string swing.vertical: Flap percentage vertically

	Example request body:

	.. code-block:: json

		{
			"id": "present",
			"temperature": 18,
			"metadata": [],
			"type4": {
				"on": true,
				"mode": "hot",
				"fan": "auto",
				"swing": {
					"horizontal": null,
					"vertical": "75"
				}
			}
		}

	**TYPE 6 and 7 (Not in production!)**

	:<json object switch: Smart switch status
	:<json object switch.on: Whether the switch is on or not