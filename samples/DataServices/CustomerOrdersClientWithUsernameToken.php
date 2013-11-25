<?php
/*
 * Copyright 2005,2006 WSO2, Inc. http://wso2.com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

$requestPayloadString = <<<XML
<customerOrders>
<customerNumber>406</customerNumber>
</customerOrders>
XML;
try {


    // Set up security options
    $security_options = array("useUsernameToken" => TRUE );
    $policy = new WSPolicy(array("security" => $security_options));
    $security_token = new WSSecurityToken(array("user" => "Raigama",
                                                "password" => "RaigamaPW",
                                                "passwordType" => "Digest"));

    $client = new WSClient(array("to" => "http://localhost/samples/DataServices/CustomerOrdersServiceWithUsernameToken.php",
                                 "action" => "http://wso2.org/samples/dataservices/customerOrders",
                                 "useWSA" => TRUE,
                                 "policy" => $policy,
                                 "securityToken" => $security_token));

    $responseMessage = $client->request( $requestPayloadString );
    printf("Response = %s <br>", htmlspecialchars($responseMessage->str));

} catch (Exception $e) {

    if ($e instanceof WSFault) {
        printf("Soap Fault: %s\n", $e->Reason);
    } else {
        printf("Message = %s\n",$e->getMessage());
    }
}
?>
