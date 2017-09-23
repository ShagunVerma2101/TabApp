//
//  Constant.h
//  ShreeAirlines
//
//  Created by NetprophetsMAC on 4/5/17.
//  Copyright © 2017 Netprophets. All rights reserved.
//

#ifndef Constant_h
#define Constant_h



#define TAG_USERTYPE_CONSULTING 1001
#define TAG_USERTYPE_AWARENESS 1002






#define IsLogin @"IsLogIn"
#define IsSectorApiHit @"IsSectorApiHit"
#define IsCountryCodeHit @"IsCountryCodeHit"

#define BoolValueKey @"BoolValue"
#define AlertKey @"Alert"

//Cloud Related

#define clear_day @"clear-day"
#define clear_night @"clear-night"
#define rain @"rain"
#define snow @"snow"
#define sleet @"sleet"
#define wind @"wind"
#define fog @"fog"
#define cloudy @"cloudy"
#define partly_cloudy_day @"partly-cloudy-day"
#define partly_cloudy_night @"partly-cloudy-night"
#define hail @"hail"
#define thunderstorm @"thunderstorm"
#define tornado @"tornado"

//Api related

#define loginUsername @"userId"
#define loginPassword @"password"
#define codeForActivatedAccount @"NP001"


//Url Related
#define firstName @"firstName"
#define lastName @"lastName"
#define emailId @"emailId"
#define mobileNo @"mobileNo"
#define recordID @"recordId"
#define isdCode @"isdCode"
#define passwordToStore @"password"


#define isValidHitNP @"NP001"
#define isValidHitOther @"SA001"
#define LoginData @"userPojo"
#define NPHeaderName @"np-usr-rest:internal@123"
#define ShreeHeaderName @"np-appusr-rest:Xy#!@#@123"
#define LocationHeaderName @"np-loc-rest:internal@123"



#define selected_Nationality @"Nationality"



#define Privacy @"Privacy"
#define TermsAndCondition @"Terms"
#define FarePolicy @"Fair"
#define ContactUS @"Contact"

#define UPCOMING @"upcoming"
#define COMPLETED @"completed"
#define CANCELED @"canceled"

//testing url
static NSString* const COLORCODE = @"#d22424";
static NSString* const COLORCODE_FOR_TEXTFIELD = @"#D88A17";


//
//static NSString* const API_Test_URL = @"http://192.168.1.118:38080/";
//static NSString* const API_UAT_URL = @"http://uat.shreeairlines.com:38080/";
//static NSString* const API_LIVE_URL = @"http://uat.shreeairlines.com:38080/";
static NSString* const API_BASE_URL = @"http://uat.shreeairlines.com:38080/";
//static NSString* const API_Temp_BASE_URL = @"http://192.168.1.118:38080/";
//static NSString* const API_Ankit_BASE_URL = @"http://192.168.1.152:8080/;
//static NSString* const API_Rubina_BASE_URL = @"http://192.168.1.164:8080/;

static NSString* const API_SA_BASE_URL = @"sa-service/";
static NSString* const API_USER_URL = @"np-user-service/users/";
static NSString* const API_LOCATION_URL = @"np-location-service/locations/";

static NSString* const API_REGISTER_USER_URL = @"create/AdminUser";
static NSString* const API_LOGIN_URL = @"authenticate/AdminUser";
static NSString* const API_UPDATE_USER_URL = @"update/AdminUser";
static NSString* const API_CHANGE_PASSWORD_URL = @"manage/AdminUser";
static NSString* const API_RESET_PASSWORD_URL = @"forgotPassword/AdminUser";
static NSString* const API_HISTORY = @"mybookings";
static NSString* const API_HISTORY_DETAIL = @"getBookingDetails";

static NSString* const API_COUNTRY_CODE = @"list/NpCountry";
static NSString* const API_WEATHER = @"list/Weather";

static NSString* const API_SECTOR_CODE_URL = @"sector";
static NSString* const API_FLIGHT = @"fligthDetails";
static NSString* const API_INITIATE_PAYMENT = @"initiatePayment";
static NSString* const API_RESERVATION_FLIGHT = @"reservation";
static NSString* const API_GETBSDATE = @"getBSDate";

static NSString* const FAIR_POLICY_URL = @"http://shreeairlines.com/fare-policy-mobile.html";
static NSString* const TERMS_POLICY_URL = @"http://shreeairlines.com/terms-and-conditions-mobile.html";
static NSString* const PRIVACY_POLICY_URL = @"http://shreeairlines.com/privacy-policy-mobile.html";
static NSString* const CONTACT_US_URL = @"http://shreeairlines.com/contact-us-mobile.html";
#endif /* Constant_h */ 
