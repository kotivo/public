
Controllers
########################################

General
****************************************

.. http:get:: /controllers/(int:controller_id)

	Retrieves controllers - if controller_id parameter is given gets a specific controller_id, gets all if controller_id is not set

	:>json boolean success: True if data gathered without errors
	:>json array data: Array of all the controller data
	:>json int id: Controller ID
	:>json string label: Name of the Controller
	:>json string version: Version of the binary installed in controller
	:>json boolean connected: Flag to see if controller has a server connection
	:>json string access: Level of access
	:>json object weather_locality: Weather station information
	:>json int weather_locality.id: Station id
	:>json string weather_locality.source: Source of weather info ie. ilmatieteenlaitos (fmi)
	:>json string weather_locality.label: Station name
	:>json string weather_locality.temperature: Outside temperature according to the weather station
	:>json boolean away: Away status
	:>json array profiles: List of profile id:s for this controller - excluding away temporarily
	:>json array modules: List of modules/devices attached to this controller
	:>json object electricity: All the necessary information needed for price calculations and energy consumption log creation
	:>json array electricity.modules: List of all the modules consuming electricity - types 2 and 4
	:>json string electricity.tariff: Billing type for electricity
	:>json object electricity.price: Pricing information for the current electricity billing type
	:>json float electricity.price.primary: One of the fields for ie. period pricings of electricity
	:>json float electricity.price.secondary: Second of the fields for ie. period pricings of electricity
	:>json object electricity.price.period: Date/Time object for the hours in all types of period pricings
	:>json object electricity.price.period.time: Duration of the price setting (hours:mins)
	:>json ISO-8601 electricity.price.period.time.begin: When the pricing period starts
	:>json ISO-8601 electricity.price.period.time.end: When the pricing period ends
	:>json object electricity.price.period.date: Beginning and end dates of the period
	:>json ISO-8601 electricity.price.period.date.begin: Beginnging date of the period pricing
	:>json ISO-8601 electricity.price.period.date.end: End date of the period pricing
	:>json float electricity.price.margin: Electricity pricing margin
	:>json float electricity.price.max_effect: Level of effect for the stock price calculations
	:>json object electricity.transmission: Electricity transmission info
	:>json string electricity.transmission.type: Type of transmission pricing
	:>json object electricity.transmission.price: Transmission pricing info
	:>json float electricity.transmission.price.primary: One of the fields for ie. period pricings of electricity transmission
	:>json float electricity.transmission.price.secondary: Second of the fields for ie. period pricings of electricity transmission
	:>json object electricity.transmission.price.period: Time and date for the beginning and end of transmission period prices
	:>json object electricity.transmission.price.period.time: Time in hours and minutes
	:>json ISO-8601 electricity.transmission.price.period.time.begin: Beginnging of the period transmission pricing
	:>json ISO-8601 electricity.transmission.price.period.time.end: End of the period transmission pricing
	:>json object electricity.transmission.price.period.date: Beginning and end dates of transmission pricing
	:>json ISO-8601 electricity.transmission.price.period.date.begin: Beginnging date of the period transmission pricing
	:>json ISO-8601 electricity.transmission.price.period.date.end: End date of the period transmission pricing
	:>json object electricity.power: Necessary info for the power calculations
	:>json int electricity.power.current: Current total power consumption
	:>json int electricity.power.max: Maximum total power consumption
	:>json object metadata: All the misc. data

	Example response:

	.. code-block:: json

		{
			"success": true,
			"data": [
				{
					"id": 666,
					"label": "666",
					"version": "v2",
					"connected": true,
					"access": "owner",
					"weather_locality": {
						"id": 101632,
						"source": "ilmatieteenlaitos",
						"label": "Joensuu Linnunlahti",
						"temperature": 7.4
					},
					"away": false,
					"profiles": [
						1,
						2
					],
					"modules": [
						19,
						20,
						21,
						22,
						23,
						24
					],
					"electricity": {
						"modules": [
							19,
							22,
							23,
							24
						],
						"tariff": "stock price",
						"price": {
						"current": 11.2,
							"usage": 0,
							"primary": 0.6,
							"secondary": 0,
							"period": {
								"time": {
									"begin": "00:00",
									"end": "00:00"
								},
								"date": {
									"begin": "--01-01",
									"end": "--01-01"
								}
							},
							"margin": 5,
							"max_effect": 1
						},
						"transmission": {
							"type": "generic",
							"price": {
								"primary": 100,
								"secondary": 0,
								"period": {
									"time": {
										"begin": "00:00",
										"end": "00:00"
									},
									"date": {
										"begin": "--01-01",
										"end": "--01-01"
									}
								}
							}
						},
						"power": {
							"current": 0,
							"max": 0
						}
					},
					"metadata": []
				}
			]
		}

.. http:get:: /controllers/(int:controller_id)/accounts/(int:account_id)

	Retrieves all the accounts attached to this controller - if account_id parameter is given gets a specific account_id, gets all if account_id is not set

	:>json boolean success: Flag to check if method call returned without errors
	:>json array data: All the object data
	:>json int id: Account id number
	:>json email email: Valid email adress for the account - Same as username
	:>json string firstname: First name of the user (spelled wrong)
	:>json string lastname: Las name of the user (spelled wrong)
	:>json string access: Access level of the user

	Example response:

	.. code-block:: json

		{
  			"success": true,
  			"data": [
    			{
      				"id": 1,
      				"email": "assi.asiakas@kotivo.fi",
      				"firstname": "assii",
      				"lastname": "asiakas",
      				"access": "owner"
    			}
  			]
		}