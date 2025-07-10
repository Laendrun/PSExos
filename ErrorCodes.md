Every known error on the API will be returned in the same manner and contain at least an HTTP error code and the specific ErrorCode

Possible error codes:

| Error Code | Short Description                                                                                | HTTP Status Code |
| ---------- | ------------------------------------------------------------------------------------------------ | ---------------- |
| 100000     | Validation Error                                                                                 | 400              |
| 100001     | Invalid Length                                                                                   | 400              |
| 100002     | Input object null                                                                                | 400              |
| 100003     | String is null or empty                                                                          | 400              |
| 100004     | Invalid format                                                                                   | 400              |
| 100005     | Required parameter missing                                                                       | 400              |
| 100006     | Parameter not allowed                                                                            | 400              |
| 100007     | Invalid range                                                                                    | 400              |
| 100008     | Allowed media count exceeded                                                                     | 400              |
| 100009     | Invalid value                                                                                    | 400              |
| 100010     | Invalid regular expression                                                                       | 400              |
| 100011     | Invalid input that could not be deserialized                                                     | 400              |
| 100012     | Returned if invalid character exists                                                             | 400              |
| 100013     | Returned if access domain does not allow a specific update period for a person                   | 400              |
| 100014     | Returned if there is invalid data                                                                | 400              |
| 100015     | Returned if there is invalid dateTime format. Valid format yyy-MM-ddTHH:mm:ss                    | 400              |
| 300000     | General Authorisation or Authentication error.                                                   | 403              |
| 300001     | Invalid license function                                                                         | 403              |
| 300002     | Media roleauth is incompatible to person type                                                    | 400              |
| 300003     | Unknown user or wrong password                                                                   | 401              |
| 300004     | Missing authorisation                                                                            | 403              |
| 300005     | License invalid                                                                                  | 403              |
| 300006     | Password expired                                                                                 | 403              |
| 300007     | Maximum number of concurrent users reached                                                       | 403              |
| 300008     | Unknown API key or Identifier                                                                    | 401              |
| 300009     | Missing category(group) authorisation                                                            | 403              |
| 300010     | User has no authorization                                                                        | 401              |
| 300011     | License limit reached                                                                            | 403              |
| 300012     | The desktop reader is not authorized                                                             | 403              |
| 300013     | The password complexity is insufficient                                                          | 400              |
| 300014     | Number of reserved licenses reached                                                              | 403              |
| 300015     | Password was already used                                                                        | 403              |
| 300016     | Number of maximum failed logins allowed is reached                                               | 429              |
| 400000     | Object not found                                                                                 | 404              |
| 400001     | Person not found                                                                                 | 404              |
| 400002     | Setting definition not found                                                                     | 404              |
| 400003     | Setting not found                                                                                | 404              |
| 400004     | Media already assigned                                                                           | 400              |
| 400005     | Media is not assigned to this person                                                             | 400              |
| 400007     | Media not found                                                                                  | 404              |
| 400008     | Media already blocked                                                                            | 400              |
| 400009     | Media already unblocked                                                                          | 400              |
| 400010     | Access right not found                                                                           | 404              |
| 400011     | Access right already assigned                                                                    | 400              |
| 400012     | Time zone not found                                                                              | 404              |
| 400013     | Access right not assigned                                                                        | 400              |
| 400014     | Category not found                                                                               | 404              |
| 400015     | Media with the given name is already defined                                                     | 400              |
| 400016     | Media with the given media number and version is already defined                                 | 400              |
| 400017     | Media definition not found                                                                       | 404              |
| 400018     | Media application definition not found                                                           | 404              |
| 400019     | Media number format not valid                                                                    | 400              |
| 400020     | Badge number exceeds the maximum length                                                          | 400              |
| 400021     | Media version missing                                                                            | 400              |
| 400022     | Media version too long                                                                           | 400              |
| 400023     | Media version not allowed                                                                        | 400              |
| 400024     | Media current role is not the transitional role                                                  | 400              |
| 400025     | Media role does not match person type                                                            | 400              |
| 400026     | Person already blocked                                                                           | 400              |
| 400027     | Person already unblocked                                                                         | 400              |
| 400028     | Resource not found                                                                               | 404              |
| 400029     | One or more badges depend on the given badge                                                     | 400              |
| 400030     | Field configuration for specific field not found                                                 | 404              |
| 400031     | Amount of Free Frields exceeded                                                                  | 400              |
| 400032     | DataType and DataFormat doesn't fit                                                              | 400              |
| 400033     | DropListValue already exists                                                                     | 400              |
| 400035     | Room not found                                                                                   | 404              |
| 400036     | Personal number already in use                                                                   | 400              |
| 400037     | Hierarchy not found                                                                              | 404              |
| 400038     | Login not found                                                                                  | 404              |
| 400039     | Login already assigned                                                                           | 400              |
| 400040     | Role already assigned                                                                            | 400              |
| 400041     | Role is not assigned to this login                                                               | 400              |
| 400042     | Role not found                                                                                   | 404              |
| 400043     | LoginId already in use                                                                           | 400              |
| 400044     | Language not found                                                                               | 404              |
| 400045     | LoginName already in use                                                                         | 400              |
| 400046     | Current login can not be deleted                                                                 | 400              |
| 400047     | Person report not found                                                                          | 404              |
| 400048     | Person has assigned medium                                                                       | 400              |
| 400049     | Person has assigned mechanical key                                                               | 400              |
| 400050     | Person has assigned key ring                                                                     | 400              |
| 400051     | Person has assigned key from depot                                                               | 400              |
| 400052     | The passageway could not be found in the database                                                | 404              |
| 400053     | The blacklist entry can not be created because it already exists                                 | 400              |
| 400054     | The blacklist entry can not be found in the database                                             | 404              |
| 400055     | The hierarchy type does not match the person type                                                | 400              |
| 400056     | The connection to required TCP service failed                                                    | 400              |
| 400057     | The time data calculation failed                                                                 | 400              |
| 400058     | No time data for the selected period                                                             | 400              |
| 400059     | Time registration with specified time already exists                                             | 400              |
| 400060     | Time registration with specified time not found                                                  | 404              |
| 400061     | The hierarchy with the given id already exists                                                   | 400              |
| 400062     | Lower levels are not possible!                                                                   | 400              |
| 400063     | A hierarchy is required to perform this action                                                   | 400              |
| 400064     | Person is already activated for time registration                                                | 400              |
| 400065     | Key assignement could not be made, because the key is already assinged                           | 400              |
| 400066     | Key assignement could not be made, key is part of a keyring                                      | 400              |
| 400067     | Key assignement could not be made, key state is not assignable                                   | 400              |
| 400068     | Key un-assignement could not be made, key is not assigned to the person                          | 400              |
| 400069     | Returned if a transitional media will replace a smartkey                                         | 400              |
| 400070     | Returned if a smartkey is used as transitional media                                             | 400              |
| 400071     | Returned if a person is not activated for time registration                                      | 400              |
| 400072     | Returned if an operation can not be executed because person is on blacklist                      | 400              |
| 400073     | Access right assignment not found                                                                | 404              |
| 400074     | Keyring assignement could not be made, keyring is already assigned                               | 400              |
| 400075     | Keyring un-assignement could not be made, keyring is not assigned to person                      | 400              |
| 400076     | Multiprofile is not active, and person already has a profile assigned                            | 400              |
| 400077     | Multiprofile is not active. It is not allowed to assign profile collections or super collections | 400              |
| 400078     | Safety check is not enabled, and changes concerning safety check should be made                  | 400              |
| 400079     | Safety check notification is not enabled and changes concerning safety ch. not. should be made   | 400              |
| 400080     | Medium can not be unblocked as long as it has a transitional medium assigned                     | 400              |
| 400084     | The safety check is expired                                                                      | 400              |
| 400085     | Desktop reader not found                                                                         | 404              |
| 400086     | Actuator not found                                                                               | 404              |
| 400087     | A transitional media already exists for current media                                            | 400              |
| 400088     | The read permission for the field is missing                                                     | 403              |
| 400089     | Validation period not found                                                                      | 404              |
| 400090     | Access domain not found                                                                          | 404              |
| 400091     | If the initialized media already exists on media                                                 | 400              |
| 400092     | If the current role of the media is not the initialized role                                     | 400              |
| 400093     | If the system is not configured for initialized cards                                            | 400              |
| 400094     | If the system is not configured for transitional cards                                           | 400              |
| 400095     | If the current role of the parent media is not the standard role                                 | 404              |
| 400096     | Returned if an access right is interfering with an existing one (multiprofile off)               | 400              |
| 400097     | Returned if someone tries to delete a system login                                               | 400              |
| 400098     | If the location can not be found with the provided LocationId                                    | 404              |
| 400099     | If a location with the LocationId already exists                                                 | 400              |
| 400100     | If the location authorisation can not be found with the provided LoginId / LocationId            | 404              |
| 400101     | More than one default location defined                                                           | 400              |
| 400102     | No default location defined                                                                      | 400              |
| 400103     | If a location with the location name already exists                                              | 400              |
| 400104     | The visit cannot be found                                                                        | 404              |
| 400105     | Manipulation on sap media is not allowed                                                         | 400              |
| 400106     | If a workstation with the workstation id already exists                                          | 400              |
| 400107     | The workstation cannot be found                                                                  | 404              |
| 400108     | The JSON string of the functions have been executed                                              | 400              |
| 400109     | Not all mandatory functions have been executed                                                   | 400              |
| 400110     | If a visit already exists                                                                        | 400              |
| 400111     | The visitor is already checked-in and/or checked-out                                             | 400              |
| 400112     | The visitor is already checked-out or not checked-in yet                                         | 400              |
| 400113     | The visit end time is before visit start time                                                    | 400              |
| 400114     | The visitor under this visit could not be found                                                  | 404              |
| 400115     | If a visitor company already exists                                                              | 400              |
| 400116     | If a visitor company could not be found                                                          | 404              |
| 400117     | If a visitor company department already exists                                                   | 400              |
| 400118     | if a visitor company department could not be found                                               | 404              |
| 400119     | The visit has the wrong state                                                                    | 400              |
| 400120     | Visitor already assigned to visit                                                                | 400              |
| 400121     | Visitor is not assigned to visit                                                                 | 404              |
| 400122     | The workstation not found within location                                                        | 404              |
| 400123     | If a workstation with the workstation name already exists                                        | 400              |
| 400124     | Visit information (VisitId) needed when assigning accessright to a visitor                       | 400              |
| 400125     | The visit state is invalid                                                                       | 400              |
| 400126     | The field could not be found                                                                     | 400              |
| 400127     | The field is not exportable to csv                                                               | 400              |
| 400128     | Visit information (VisitId) needed when assigning a badge to a visitor                           | 400              |
| 400129     | The free field usage is not allowed                                                              | 400              |
| 400130     | The mapping of the free field type was not possible                                              | 400              |
| 400131     | The free field type / free field column combination is not allowed                               | 400              |
| 400132     | The free field value list contains duplicate values                                              | 400              |
| 400133     | The free field value list is not allowed for this free field type                                | 400              |
| 400134     | The free field value list is needed for this free field type                                     | 400              |
| 400135     | The Access right is not assignable to a person of this type                                      | 400              |
| 400136     | The View already exists                                                                          | 400              |
| 400137     | The resourcetext already exists                                                                  | 400              |
| 400138     | View not found                                                                                   | 404              |
| 400139     | Function is not allowed because tenant is not base tenant of this person                         | 400              |
| 400140     | The tenant cannot be found                                                                       | 404              |
| 400141     | The person is already released to this tenant                                                    | 400              |
| 400142     | The person can not be unrealesed from it's base tenant                                           | 400              |
| 400143     | Access rights do not belong to current tenant                                                    | 400              |
| 400144     | Room does not belong to current tenant                                                           | 400              |
| 400145     | Assigned badge cannot be deleted                                                                 | 400              |
| 400146     | Person does not have the correct type                                                            | 400              |
| 400147     | The operation is not supported for mobile access media                                           | 400              |
| 400148     | Function is not allowed because person already has mobile access device                          | 400              |
| 400149     | Mobile access is already activated                                                               | 400              |
| 400150     | Function is not allowed because person has no mobile access device                               | 400              |
| 400151     | Mobile access user medium definition is missing                                                  | 400              |
| 400152     | Mobile access service is not available                                                           | 400              |
| 400153     | At least one authorisation could not be found in the database                                    | 404              |
| 400154     | The given authorisation value is not allowed for this authorisation                              | 400              |
| 400155     | The role already exists                                                                          | 400              |
| 400156     | The role is a default role and may not be edited                                                 | 400              |
| 400157     | A role of type 'System' can not be created / updated / deleted                                   | 400              |
| 400158     | The role is a assigned to a login and can not be disabled                                        | 400              |
| 400159     | The role is disabled and can not be assigned to a login                                          | 400              |
| 400160     | The authorisation group could not be found                                                       | 404              |
| 400161     | The person is blocked                                                                            | 400              |
| 400162     | The authorisation type does not match admin role                                                 | 400              |
| 400163     | The authorisation type does not match employee self service role                                 | 400              |
| 400164     | The role is assigned to a login and can not be deleted                                           | 400              |
| 400165     | The person has no authorisation for intervention media                                           | 400              |
| 400166     | A contractor having employees can not be deleted                                                 | 400              |
| 400167     | The source role type is not equal to destination role type                                       | 400              |
| 400168     | The parameter could not be found                                                                 | 404              |
| 400169     | The parameter requested is not unique                                                            | 400              |
| 400170     | The parameter is not on white list                                                               | 400              |
| 400171     | The value of 'notification in days' must be smaller than the value of 'validity in days'         | 400              |
| 400172     | The locker was not found                                                                         | 404              |
| 400173     | The locker group was not found                                                                   | 405              |
| 400174     | The safety check expiration date may not be in the past                                          | 400              |
| 400175     | The subject is missing for the visitor check-in confirmation mail                                | 400              |
| 400176     | The from mail adress is missing for the visitor check-in confirmation email                      | 400              |
| 400177     | The person of the currently logged in user can not be deleted                                    | 400              |
| 400178     | The system time zone does not exist                                                              | 404              |
| 400179     | The access right cannot be used for a visitor management qr code                                 | 400              |
| 400180     | The media definition cannot be used for a qr code                                                | 400              |
| 400181     | The operation is not allowed for the actual locker state                                         | 400              |
| 400182     | The operation can not be executed because lockergroup is not activated                           | 400              |
| 400183     | The lockergroup is not configured correctly                                                      | 400              |
| 400184     | The operation can only be executed by operator of this lockergroup                               | 400              |
| 400185     | No proposal of locker possible, because a locker of this group is already assigned to the person | 400              |
| 400186     | No proposal of locker possible, because for this lockergroup there is no locker available        | 400              |
| 400187     | Sending a qr code is disabled in the configuration                                               | 400              |
| 400188     | The operation can only be executed on an owner locker                                            | 400              |
| 400189     | The operator to be set for lockergroup doesn't have enough category rights for the group periph. | 400              |
| 400190     | Person cannot be deleted because there is one or more online locker assigned                     | 400              |
| 400191     | The given operator is not operator of this online locker group                                   | 400              |
| 400192     | The roomzone not found is returned if a room has been searched but not found                     | 400              |
| 400193     | The number of passed direct call destinations surpasses the maximum                              | 400              |
| 400194     | Not all entities in the passed list have a different id. There are some duplicates in the list   | 400              |
| 400195     | The visit can not be deleted, because there are still active visitors                            | 400              |
| 400196     | The visitor company can not be deleted, because it is still assigned to at least one visitor     | 400              |
| 400197     | The visitor company departement can not be deleted, because it is still assigned to a visitor    | 400              |
| 400198     | Office-Flow error has occured. No info from office flow system                                   | 400              |
| 400199     | Office-Flow error has occured.                                                                   | 400              |
| 400200     | The number of passed office flow profiles surpasses the maximum                                  | 400              |
| 400201     | The office flow client certificate was not found                                                 | 404              |
| 400202     | There was an office flow connection error                                                        | 400              |
| 400203     | The calendar was not found                                                                       | 404              |
| 400204     | The doorgroup was not found                                                                      | 404              |
| 400205     | The passageway code was not found                                                                | 404              |
| 400206     | Profile was not found                                                                            | 404              |
| 400207     | Report was not found                                                                             | 404              |
| 400208     | The application view is not allowed for this endpoint                                            | 400              |
| 400209     | The office flow data did not validate against the schema                                         | 400              |
| 400210     | The ExtendedLatchTimeActive flag can only be set for OSS components                              | 400              |
| 400211     | The person is host or deputy in an upcoming or ongoing visit                                     | 400              |
| 400212     | The combination of tree type and tree path is not allowed                                        | 400              |
| 400213     | The command is not defined for the device type                                                   | 400              |
| 400214     | >The command is not defined                                                                      | 400              |
| 400215     | The device is not found                                                                          | 400              |
| 400216     | The device has a wrong type                                                                      | 400              |
| 400217     | The sub device type is required                                                                  | 400              |
| 400218     | The command is not defined for the passageway type                                               | 400              |
| 400220     | The command is not defined for the passageway type                                               | 400              |
| 400221     | The id of the device is not correctly formatted                                                  | 400              |
| 400222     | The actuator adress is invalid                                                                   | 400              |
| 400230     | No export could be found with the given identifier                                               | 404              |
| 400232     | The planned profile cannot be created, because the id already exists                             | 400              |
| 400233     | The planned profile cannot be created, because the DateTime is already in use                    | 400              |
| 400234     | Required Value Missing from body                                                                 | 400              |
| 400235     | Value invalid from body                                                                          | 400              |
| 400236     | Planned profile could not be found                                                               | 400              |
| 400237     | Max amount reached                                                                               | 400              |
| 400240     | Issue User Medium failed du to error in EACM Update Service                                      | 400              |
| 400241     | Concurrency-Error. The action you tried to execute probably relied on data that has been changed | 400              |
| 400242     | Import has not completed                                                                         | 400              |
| 400243     | The action you tried to delete while there were still references in other tables                 | 400              |
| 400244     | Mapping data transfer objects to business logic objects failed                                   | 400              |
| 400245     | Missing clientId                                                                                 | 500              |
| 400246     | Maximum number of AccessDomains reached                                                          | 500              |
| 400247     | Maximum number of CardLink reached                                                               | 500              |
| 400248     | Invalid from and to                                                                              | 500              |
| 400249     | Timezone row order number not unique                                                             | 400              |
| 400250     | Timezone row order number are not consecutive                                                    | 400              |
| 400251     | Timezone row order number zero does not exist                                                    | 400              |
| 400252     | Invalid type of controller                                                                       | 400              |
| 400253     | Controller not found                                                                             | 400              |
| 400254     | Delete controller failed                                                                         | 500              |
| 400255     | Updating timezone rows failed                                                                    | 500              |
| 400256     | Loxtop not found                                                                                 | 400              |
| 400257     | Assigning loxtop depot(s) to a person failed                                                     | 500              |
| 400258     | Default timezone cannot be deleted                                                               | 400              |
| 400259     | Visitor still has active visits                                                                  | 400              |
| 400260     | Objects or some of its values are not unique                                                     | 400              |
| 400261     | The user does not have enough permission to perform this action for this location                | 400              |
| 400262     | SubDevice not found                                                                              | 400              |
| 400263     | Master media already exists with this name                                                       | 400              |
| 400264     | Master media already exists with this uid                                                        | 400              |
| 400265     | Master media already exists with this legic uid                                                  | 400              |
| 400266     | Master media LegicUid and MediumUid are the same                                                 | 400              |
| 400267     | The master medium cannot be deleted because it is still being used by one ore more actuators     | 400              |
| 400269     | Requested badge does not exist                                                                   | 400              |
| 400270     | Actuator technology is invalid for master T                                                      | 400              |
| 400271     | Badge cannot be updated because the badge is already a Intervention badge                        | 400              |
| 400272     | Badge cannot be updated because the badge is already assigned to a person                        | 400              |
| 400273     | Invalid license                                                                                  | 400              |
| 400274     | Maximum of 20 cabinet lock administration mediums per client reached                             | 400              |
| 400275     | Badge cannot be updated because the badge is already a Cabinet lock Admin badge                  | 400              |
| 400276     | No intervention max value                                                                        | 400              |
| 400277     | Maximum of intervention mediums per client reached                                               | 400              |
| 400278     | Media Applications with following badge number 123,124,125 already exists                        | 400              |
| 400279     | Time profiles are not valid                                                                      | 400              |
| 400280     | Invalid control profile name changed                                                             | 400              |
| 400281     | Default profiles can not be modified or deleted                                                  | 400              |
| 400282     | Maximum number of control profiles reached                                                       | 400              |
| 400283     | Badge is linked with smart key and therefore cannot be deleted                                   | 400              |
| 400284     | Badge number exceeds the maximum value                                                           | 400              |
| 400285     | Overlapping time zones for the same day                                                          | 400              |
| 400286     | Difference between TimeFrom and TimeTo less than a minute                                        | 400              |
| 400287     | TimeFrom is greater than TimeTo                                                                  | 400              |
| 400288     | Oss time zone row can have day flags set to true just from Mo to Su                              | 400              |
| 400290     | Oss time zone number of days greater than configured numbers of day settings                     | 400              |
| 400291     | Oss time zone number of time periods greater than configured number of time periods              | 400              |
| 400292     | The login is not valid for single sign-on (SSO) authentication                                   | 400              |
| 400293     | First time profile of a day configuration has a invalid index                                    | 400              |
| 400294     | Oss time zone should have minimum one time zone profile                                          | 400              |
| 400295     | Oss time zone profile should have minimum one time zone rows                                     | 400              |
| 400296     | Invalid profile at least one type should be marked as true                                       | 400              |
| 400297     | Profile with this name already exists                                                            | 400              |
| 400298     | Person has reached the maximum number of assigned time zone profiles per OSS site                | 400              |
| 400299     | Person has reached the maximum number of assigned profiles per OSS site                          | 400              |
| 400300     | Person has reached the maximum number of assigned individual rights per OSS site                 | 400              |
| 400301     | Duplicate elements exists                                                                        | 400              |
| 400302     | Oss timezone with this name already exists                                                       | 400              |
| 400303     | OssSo mediaApplicationDefinition segment length is too small                                     | 400              |
| 400304     | OssSo administration was not found                                                               | 400              |
| 400305     | Maximum number of elements reached                                                               | 400              |
| 400306     | Auto create badge is not possible because of not activated parameter                             | 400              |
| 400307     | OSS-SO media definition is not assigned to an OSS-SO administration area                         | 400              |
| 400315     | OSS-SO time zone cannot be assigned to profile door group if the profile is already assigned...  | 400              |
| 400316     | Badge/Person detail data could not be persisted (Deleted)                                        | 400              |
| 500000     | Returned if Rabbit Mq Message could not be published                                             | 400              |
| 500001     | Returned if data could not be persisted                                                          | 400              |
| 999999     | Unknown error                                                                                    | 500              |
| 405        | Method not allowed. Using POST instead of GET might be a cause for it                            | 400              |
