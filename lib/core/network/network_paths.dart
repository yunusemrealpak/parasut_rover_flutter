class NetworkPaths {
  // Startup

  static const CHECK_VERSION = "/Version/CheckVersion";

  // Authenticate

  static const LOGIN = '/Account/login';
  static const LOGIN_SMS = '/Account/smslogin';
  static const REGISTER = '/Account/register';
  static const REGISTER_SMS = '/Account/smsregister';
  static const FORGOT_PASSWORD = "/Account/forgetPassword";
  static const PHONE_VERIFY = '/account/phoneVerify';

  static const CREATE_CLIENT_CODE = '/EClient/create';

  static const GET_MAINCATEGORIES = "/ECategory/get";
  static const GET_PRODUCTS = "/Products/get";
  static const GET_DELIVERYTIMES = "/";
  static const GET_BASKET = "/EBasket/get";
  static const UPDATE_BASKET = "/Basket/set";
  static const GET_PRODUCT = "/EProduct/get";
  static const GET_DELIVERY_AREAS = '/EServiceLocation/get';
  static const GET_SLIDERS = "/ECompanyMedia/get";
  static const GET_VENDOR = "/EVendor/get";
  static const GET_SECTIONS = '/Content/pages';
  static const DELETE_BASKET = '/EBasket/delete';
  static const GET_ORDERS = '/EOrder/get';
  static const GET_SHIP_TOTAL = '/Basket/shipTotal';
  static const SET_BASKET_SHIP_TOTAL = '/Basket/setShip';
  static const CREATE_ADDRESS = "/EAddress/Create";
  static const CREATE_USER_ADDRESS = "/EUserAddress/Create";
  static const UPDATE_ADDRESS = "/EAddress/Update";

  static const UPDATE_ACCOUNT = "/Account/update";

  // Delivery
  static const GET_DELIVERY_TIMES = '/EShippingTime/get';
  static const GET_SHIP_COMPANY_VENDORS = "/EShipCompanyVendor/get";
  static const GET_SHIP_COMPANY = "/Order/shipCompany";
  static const SET_ORDER = "/Order/set";
  static const SEND_CREDIT_CARD = "/Payment/CreateGatwayRequest";
  static const UPDATE_ORDER = "/EOrder/update";
  static const COMPLETE_ORDER = "/Order/complete";
  static const CREATE_ORDER_PAYMENT = "/EOrderPayment/create";
  static const GET_PAY_METHOD_VENDORS = "/EPayMethodVendor/get";

  static const GET_REGIONS = "/region/locaddress";

  static const SET_LOG = "/Log/SetLog";

  static const GET_CITIES = "/Region/province";
  static const GET_DISTRICTS = "/Region/district";
  static const GET_NEIGHBORHOODS = '/Region/neigh';
  static const GET_NEIGH_FROM_TABLE = '/ENeighborhood/get';
  static const GET_COMPANIES = "/ECompany/get";

  static const GET_PRODUCT_FOR_BASKET = "/Basket/itemOption";
  
  /////////////////////////////////////
  ///
  /// CALL CENTER ENDPOINTS
  /// 
  /////////////////////////////////////
  ///
  
  static const GET_USER_BY_PHONE = "/Customer/byphone";
  static const CREATE_USER_BY_PHONE = "/Customer/createwithphone";
  
  static const LAST_SESSIONS = "/Customer/lastsession";
  static const LAST_ACTIVE_ORDERS = "/Order/active";
  static const GET_INTERNAL = "/call/getInternal";
  static const CONNECT_CALL_API = "/call/check";

  static const CHANGE_USER_SESSION = "/Customer/changesession";
  
  static const GET_PAYMENT_OPTIONS = "/Payment/options";
  static const GET_MISSED_CALLS = "/missedcall/get";
  static const RETURN_MISSED_CALL = "/outsideline/call";
}
