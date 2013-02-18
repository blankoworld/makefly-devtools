<? /* 
This is a PHP server side implementation of Jskomment. 
It is meant to be used with an appropriate .htaccess file
See http://code.google.com/p/jskomment/
*/

@include('jskomment.local.php');
@define('DATADIR','./jskomment-data/');

/** returns a concatenation of jquery, json2 and jskomment, plus the initialization of jskomment */
function jskomment_js() {
  header('Content-type: text/javascript');

  echo " if (window.jQuery === undefined) { \n";
  readfile('jquery-1.5.1.min.js');
  echo "}// end jquery \n";

  echo "\n if (window.swfobject === undefined) { \n";
  @readfile("swfobject.js");
  echo "}// end swfobject \n";

  readfile('json2.js');

  readfile('jskomment-core.js');

  $base_url = './';
  if (isset($_GET['JSKOMMENT_url'])) {
    $base_url = $_GET['JSKOMMENT_url'];
  }

  echo "JSKOMMENT.url = '{$base_url}';\n";

  echo "JSKOMMENT.main();\n";
  exit;
}

/** checks whether the recaptcha is correct if a private key is defined, then returns the $comment data without recaptcha info */
function check_recaptcha($comment) {
  $recaptcha_response_field = @$comment['recaptcha_response_field'];
  $recaptcha_challenge_field = @$comment['recaptcha_challenge_field'];

  unset($comment['recaptcha_response_field']);
  unset($comment['recaptcha_challenge_field']);

  require_once('recaptchalib.php');
  
  if (!defined('RECAPTCHA_PRIVATE_KEY')) { // should be defined in jskomment.local.php
    return $comment;
  }
  
  $resp = recaptcha_check_answer (RECAPTCHA_PRIVATE_KEY,
                                      $_SERVER["REMOTE_ADDR"],
                                      $recaptcha_challenge_field,
                                      $recaptcha_response_field);

  if ($resp->is_valid) {
    return $comment;
  } else {
    header('HTTP/1.0 403 Unauthorized');
    exit;
  }
}

/** sets HTTP response headers to support cross-domain calls */
function allow_cross_domain() {
  header("Access-Control-Allow-Origin: *");
  if (@isset($_SERVER['HTTP_CONTROL_REQUEST_METHOD'])) {
    header("Access-Control-Allow-Methods: ".$_SERVER['HTTP_CONTROL_REQUEST_METHOD']);
  }
  if (@isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS'])) {
    header("Access-Control-Allow-Headers: ".$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']);
  }
}

/** returns all comments matching $query['title'] as a PHP array */
function get_comments($query) {
  $result = array();
  $fname=DATADIR.sha1($query['title']);
  //echo $fname;
  if (file_exists($fname)) {
    foreach(file($fname) as $comment) {
      $result[] = json_decode($comment, true);
    }
  } // end if
  return $result;
}


/** gets the request data depending on HTTP method, content-type and accept headers */
function get_request_data() {
  if (is_jsonp()) { // must be first
    return json_decode($_GET['data'], true);
  } 
  if ($_SERVER['REQUEST_METHOD']=='GET') {
    if (@$_SERVER['CONTENT_TYPE']=='application/json') { 
      // we don't use $_SERVER['QUERY_STRING']
      // since it is set after .htaccess rewriting
      $query_string = rawurldecode(parse_url($_SERVER['REQUEST_URI'], PHP_URL_QUERY));
      return (json_decode($query_string, true));
    } else {
      return (json_decode($_GET['data'], true));
    }
  }
  if ($_SERVER['REQUEST_METHOD']=='POST') {
    
    if ($_SERVER['CONTENT_TYPE']=='application/x-www-form-urlencoded') {
      //file_put_contents('/tmp/foo',var_export(json_decode($_POST['data'], true), true));
      return (json_decode($_POST['data'], true));
    } else {
      $data = file_get_contents("php://input");
      return (json_decode($data, true));
    }
    
  }
  die;
}

/** returns a JSON string of all comments matching the HTTP POST input as JSON */
function get_single_comment_as_json() {
  return json_encode(get_comments(get_request_data()));
}

/** returns a list of list of comments */
function get_comments_as_json() {
  $response = array();
  foreach(get_request_data() as $query) {
    $response[] = get_comments($query);
  } // end foreach
  return json_encode($response);
}

/** adds a $comment (assoc array) in the database */
function add_comment($comment) {
  $comment = check_recaptcha($comment);
  $fname=DATADIR.sha1(@$comment['title']);
  $file  = fopen($fname, "a");
  fputs($file,json_encode($comment)."\n");
  fclose($file);
  return '{}'; // for json-p
}

function is_jsonp() {
  return (@$_GET['contentType']== 'application/jsonp') || preg_match('/text\/javascript|application\/javascript/', $_SERVER['HTTP_ACCEPT']);
}

/** outputs a JSON object in JSONP of pure JSON depending on the request */
function output($response) {
  if (is_jsonp()) {
    header('Content-type: text/javascript');
    echo $_GET['callback'].'('.$response.");\n";
  } else {
    header('Content-type: application/json');
    echo $response;
    //file_put_contents('/tmp/jskomment.log', $response);
  }
}

function main() {

  allow_cross_domain();
    
  if (@$_GET['file']==='jskomment.js') jskomment_js();
  if (@$_GET['action']==='p') output(add_comment(get_request_data()));
  if (@$_GET['action']==='sx') {
    output(get_comments_as_json());
  }
  if (@$_GET['action']==='s') {
    output(get_single_comment_as_json());
  }
  if (@$_GET['action']==='t') {
    output(json_encode(get_request_data()));
  }

}

main();

?>
