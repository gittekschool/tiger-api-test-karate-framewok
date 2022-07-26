Feature: New accounts Feature

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token

  #Scenario: Create new Account Happy pass
    #Given path "/api/accounts/add-primary-account"
    #And request {"email": "yahya-api-automation9@gmail.com","title": "Mr.","firstName": "SayedYahya","lastName": "Hussaini","gender": "MALE","maritalStatus": "MARRIED","employmentStatus": "student","dateOfBirth": "1989-20-07"}
    #And header Authorization = "Bearer "+generatedToken
    #When method post
    #Then status 201
    #* def generatedId = response.id
    #And print generatedId
    #And print response

  Scenario: Add new Account with Existing Email address
    Given path "/api/accounts/add-primary-account"
    And request {"email": "yahya-api-automation9@gmail.com","title": "Mr.","firstName": "SayedYahya","lastName": "Hussaini","gender": "MALE","maritalStatus": "MARRIED","employmentStatus": "QA Engineer","dateOfBirth": "1989-20-07"}
    And header Authorization = "Bearer "+generatedToken
    When method post
    Then status 400
    * def errorCode = response.errorCode
    * def httpStatus = response.httpStatus
    * def dataBaseResponse = response.errorMessage
    And assert errorCode =="ACCOUNT_EXIST"
    And assert httpStatus =="BAD_REQUEST"
    And assert dataBaseResponse =="Account with Email yahya-api-automation9@gmail.com is exist"
    And print response

  Scenario: Add car to existing Account
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = 45
    And request {"make": "Volvo","model": "XC90","year": "2018","licensePlate": "YLF-2922"}
    And header Authorization = "Bearer "+generatedToken
    When method post
    Then status 201
    And print response

  Scenario: Add Phone Number to Existing Account
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = 45
    And request {"phoneNumber": "5404566984","phoneExtension": "N/A","phoneTime": "Evening","phoneType": "Mobile"}
    And header Authorization = "Bearer "+generatedToken
    When method post
    Then status 201
    And print response

  Scenario: Add Address to Existing Account
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = 45
    And request {"current": true , "addressType": "Apartment","addressLine1": "5342 Mountain Rd","city": "GlenAllen","state": "Virginia","postalCode": "5342","countryCode": "+1"}
    And header Authorization = "Bearer "+generatedToken
    When method post
    Then status 201
    And print response
