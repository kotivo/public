
Accounts
########################################

Authentication
****************************************

Authentication can be done either using session (browser environments) or using HTTP Basic Auth (scripts etc).

.. http:get:: /accounts/login/

	Simply return current account information or access denied if not logged in.
	Can also be used to check if authentication is ok when using HTTP Basic Auth.

	:>json int id: Account ID
	:>json email username: Username (email)
	:>json string language: ISO 639-1 language code

	Example using curl:

	.. code-block:: bash

		curl -s -u 'user@example.com:password' \
		'https://api.host/api/v1/accounts/login/' | python -m json.tool

	Response:

	.. code-block:: json

		{
			"success": true,
			"data": {
				"id": 1,
				"username": "user@example.com",
				"language": "fi"
			}
		}

.. http:put:: /accounts/login/

	Authenticate account to current session.

	:<json email username: Username (email)
	:<json string password: Password

	Example request body:

	.. code-block:: json

		{
			"username": "user@example.com",
			"password": "password"
		}

	Response is the same as for GET.

.. http:get:: /accounts/logout/

	Logout current session.

Information
****************************************

.. http:get:: /accounts/(int:id)

	Retrieve authenticated account information.

	:>json int id: Account ID
	:>json email email: Email
	:>json string firstname: First name
	:>json string lastname: Last name
	:>json string phone: Phone number
	:>json object address: Address information
	:>json string address.street: Street
	:>json string address.postcode: Postcode
	:>json string address.city: City
	:>json ISO-3166-1 address.country: Country
	:>json string messaging:
		Send messages using:
		
		* disabled
		* email
		* sms

	:>json ISO-8601 last_visit: Date and time of last login
	:>json ISO-8601 registered: Date and time of registration
	:>json array controllers: List of controller IDs registered to this account
	:>json string language: ISO 639-1 language code
	:>json object messages: Count of messages, total and unseen
	:>json int messages.total: Total message count
	:>json int messages.unseen: Unseen message count
	:>json object metadata: Custom metadata

	Example response:

	.. code-block:: json

		{
		  "success": true,
		  "data": {
		    "id": 1,
		    "email": "username@example.com",
		    "firstname": "Sherlock",
		    "lastname": "Holmes",
		    "phone": "+44 20 7224 3688",
		    "address": {
		      "street": "221B Baker Street",
		      "postcode": "WC2N 5DB",
		      "city": "London",
		      "country": "GB"
		    },
		    "messaging": "disabled",
		    "last_visit": "1904-10-22T13:31:51+01:00",
		    "registered": "1881-01-15T12:37:44+01:00",
		    "controllers": [
		      1859,
		      1930
		    ],
		    "language": "en",
		    "messages": {
		      "total": 17,
		      "unseen": 2
		    },
		    "metadata": {
		      "my-personal-stuff": {
		        "anything": "yes"
		      },
		      "system-user-interface": "might be something system related here"
		    }
		  }
		}

Utility
****************************************

.. http:put:: /accounts/invite

	Send email to invite new user for the controller

	Example response:

	.. code-block:: json

		{
		  "success": true,
		  "data": []
		}

.. http:put:: /accounts/password/reset

	Sends email to the corresponding user with the password reset link

	Example response:

	.. code-block:: json

		{
		  "success": true,
		  "data": []
		}

.. http:get:: /accounts/messages/(int:message_id)

	Gets one message from database according to message_id.

	Example response:

	.. code-block:: json

		{
	  		"success": true,
	  		"data": {
	   	 		"id": 156,
	    		"subject": "Kotivo yhteysvika: 666",
	    		"content": "Keskusyksikkösi \"666\" ei ole ollut yhteydessä vuorokauteen. Tarkista keskusyksikkösi internet yhteys.",
	    		"created": "2019-09-25T11:56:01+03:00",
	    		"seen": true,
	    		"metadata": {
	      			"dismissed": true
	    		}
	  		}
		}

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

Devices
########################################

General
****************************************

.. http:get:: /controllers/(int:controller_id)/modules/(int:module_id)

	Retrieves all the modules (devices) registered to this controller - can target a specific module_id device, gets all if module_id is not set

	:>json boolean success: Flag to check if method call was a success
	:>json array data: All the device objects in an array
	:>json int id: Device id number
	:>json string label: Name of the device - shown in ui
	:>json int serial_number: Serial number - used in authentication
	:>json string verification_code: Series of numbers and/or letters (case sensitive) for authentication
	:>json int type: Type code
	:>json boolean connected: Flag to see if device is connected to the controller
	:>json boolean weather_station: Flag to see whether or not device is used as weather station
	:>json object error: Error message information
	:>json int error.code: Error code id
	:>json string error.msg: Error message from device
	:>json object metadata: All the misc. data is stored here as "key" : data pairs
	:>json int metadata.order: ASK
	:>json boolean away: Flag to see whether or not the device is in away state
	:>json object temperature: Temperature data
	:>json float temperature.current: Current measured average temperature with two decimal accuracy
	:>json float temperature.target: Current target temperature to achieve
	:>json object temperature.warning: All the temperature warning limits
	:>json int temperature.warning.min: Limit minimum when temperature warnings are sent
	:>json int temperature.warning.max: Limit maximum when temperature warnings are sent
	:>json boolean temperature.advance: Flag the check whether or not advance heating is on
	:>json int temperature.safety: Safety target temperature when connection is ofline 30min. or more
	:>json object temperature.floor_sensor: Settings to show if floor sensor controls, is in use or is disabled - also saves the floor temperature in its own variable
	:>json float temperature.floor_sensor.current: Current floor temperature
	:>json string temperature.floor_sensor.mode: Current floor sensor mode - installed, control_by and null
	:>json object temperature.freeze_limit: Freeze limit data
	:>json boolean temperature.freeze_limit.on: Flag to see whether or not the freeze limit is in use
	:>json int temperature.freeze_limit.when: Temperature minimum for freeze limit - needs to be set according to heater specifications
	:>json object humidity: All the humidity data
	:>json float humidity.current: Current measured relative humidity with two decimal accuracy
	:>json object humidity.warning: All the humidity warning limits
	:>json int humidity.warning.min: Limit minimum when humidity warnings are sent
	:>json int humidity.warning.max: Limit maximum when humidity warnings are sent
	:>json object electricity: Electricity data
	:>json object electricity.price: Price data
	:>json string electricity.price.max_effect: Effect of stock electricity prices (should be int or float?)
	:>json string manufacturer: Manufacturer of current ASHP unit
	:>json ISO-8601 rapid_heat: Rapid heating on ASHP !DEPRECATED!
	:>json int power: Maximum power consumption of heater in wats

	Example response:

	.. code-block:: json

		{
			"success": true,
			"data": {
				"id": 22,
				"label": "patteri3",
				"serial_number": 10115,
				"verification_code": "12345678",
				"type": 2,
				"connected": false,
				"weather_station": null,
				"error": {
					"code": 0,
					"msg": "Messages not in use so far."
				},
				"metadata": {
					"order": 4
				},
				"away": false,
				"temperature": {
					"current": 0,
					"target": 23.32,
					"warning": {
						"min": -50,
						"max": 50
					},
					"advance": false,
					"safety": 20,
					"floor_sensor": {
						"current": null,
						"mode": "off"
					},
					"heating": false
				},
				"humidity": {
					"current": 0,
					"warning": {
						"min": 0,
						"max": 100
					}
				},
				"electricity": {
					"price": {
						"max_effect": "1.0"
					}
				},
				"power": 0
			}
		}

.. http:put:: /controllers/(int:controller_id)/modules/(int:module_id)

	Creates/updates a new device according to parameters - controller_id, label, serial_number and ferification_code are required, type can be left empty but proper functionality requires type != 0. If physical device is found, controller gets and sets type accordingly

	Example response:

	.. code-block:: json

		{
			"success": true,
			"data": {
				"id": 28,
				"label": "puttis",
				"serial_number": 100000,
				"verification_code": "12345678",
				"type": 0,
				"connected": false,
				"weather_station": false,
				"error": {
					"code": 0,
					"msg": "Messages not in use so far."
				},
				"metadata": []
			}
		}
