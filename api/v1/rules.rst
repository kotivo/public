Rules
########################################
General
****************************************

.. http:get:: /controllers/(int:controller_id)/modules/(int:device_id)/rules/(int:profile_id)

	Gets all the rules for certain device_id and profile_id - gets all if profile_id is not given

	:>json string id: Name of the rule - int if self made rule
	:>json float temperature: Target temperature for this rule
	:>json array metadata: All the misc. data
	:>json object type4: The name of the key changes according to device type. Object includes all the different settings for the rule
	:>json boolean type4.on: Is the device on right now?

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
