#' Convert input to UN code
#'
#' This function takes a vector of nationalities and returns a vector of
#' corresponding country names.
#'
#' @param nationality Vector of nationalities to be converted
#' @param alpha2 Vector of alpha 2 code to be converted
#' @param alpha3 Vector of alpha 3 code to be converted
#' @param UN_code Vector of UN Code to be converted
#' @param country Vector of country to be converted
#'
#' @author Farhan Shah Jahan
#'
#' @return Vector of corresponding country names
#' @examples
#' nationality <- c("American", "Canadian")
#' convert2un_code(nationality)
#' @export
#'
convert2un_code <- function(country, alpha2, alpha3) {
  data <- "Country,Nationality,Alpha2,Alpha3,UN_code
Afghanistan,Afghan,AF,AFG,4
Albania,Albanian,AL,ALB,8
Algeria,Algerian,DZ,DZA,12
Argentina,Argentine,AR,ARG,32
Argentina,Argentinian,AR,ARG,32
Australia,Australian,AU,AUS,36
Austria,Austrian,AT,AUT,40
Bangladesh,Bangladeshi,BD,BGD,50
Belgium,Belgian,BE,BEL,56
Bolivia,Bolivian,BO,BOL,68
Botswana,Batswana,BW,BWA,72
Brazil,Brazilian,BR,BRA,76
Bulgaria,Bulgarian,BG,BGR,100
Cambodia,Cambodian,KH,KHM,116
Cameroon,Cameroonian,CM,CMR,120
Canada,Canadian,CA,CAN,124
Chile,Chilean,CL,CHL,152
China,Chinese,CN,CHN,156
Colombia,Colombian,CO,COL,170
Costa Rica,Costa Rican,CR,CRI,188
Croatia,Croatian,HR,HRV,191
Cuba,Cuban,CU,CUB,192
Czechia,Czech,CZ,CZE,203
Czech Republic,Czech,CZ,CZE,203
Denmark,Danish,DK,DNK,208
Dominican Republic,Dominican,DO,DOM,214
Ecuador,Ecuadorian,EC,ECU,218
Egypt,Egyptian,EG,EGY,818
El Salvador,Salvadorian,SV,SLV,222
England,English,GB,GBR,826
Estonia,Estonian,EE,EST,233
Ethiopia,Ethiopian,ET,ETH,231
Fiji,Fijian,FJ,FJI,242
Finland,Finnish,FI,FIN,246
France,French,FR,FRA,250
Germany,German,DE,DEU,276
Ghana,Ghanaian,GH,GHA,288
Greece,Greek,GR,GRC,300
Guatemala,Guatemalan,GT,GTM,320
Haiti,Haitian,HT,HTI,332
Honduras,Honduran,HN,HND,340
Hungary,Hungarian,HU,HUN,348
Iceland,Icelandic,IS,ISL,352
India,Indian,IN,IND,356
Indonesia,Indonesian,ID,IDN,360
Iran,Iranian,IR,IRN,364
Iraq,Iraqi,IQ,IRQ,368
Ireland,Irish,IE,IRL,372
Israel,Israeli,IL,ISR,376
Italy,Italian,IT,ITA,380
Jamaica,Jamaican,JM,JAM,388
Japan,Japanese,JP,JPN,392
Jordan,Jordanian,JO,JOR,400
Kenya,Kenyan,KE,KEN,404
Kuwait,Kuwaiti,KW,KWT,414
Laos,Lao,LA,LAO,418
Latvia,Latvian,LV,LVA,428
Lebanon,Lebanese,LB,LBN,422
Libya,Libyan,LY,LBY,434
Lithuania,Lithuanian,LT,LTU,440
Madagascar,Malagasy,MG,MDG,450
Malaysia,Malaysian,MY,MYS,458
Mali,Malian,ML,MLI,466
Malta,Maltese,MT,MLT,470
Mexico,Mexican,MX,MEX,484
Mongolia,Mongolian,MN,MNG,496
Morocco,Moroccan,MA,MAR,504
Mozambique,Mozambican,MZ,MOZ,508
Namibia,Namibian,NA,NAM,516
Nepal,Nepalese,NP,NPL,524
Netherlands,Dutch,NL,NLD,528
New Zealand,New Zealand,NZ,NZL,554
Nicaragua,Nicaraguan,NI,NIC,558
Nigeria,Nigerian,NG,NGA,566
Norway,Norwegian,NO,NOR,578
Pakistan,Pakistani,PK,PAK,586
Panama,Panamanian,PA,PAN,591
Paraguay,Paraguayan,PY,PRY,600
Peru,Peruvian,PE,PER,604
Philippines,Philippine,PH,PHL,608
Poland,Polish,PL,POL,616
Portugal,Portuguese,PT,PRT,620
Romania,Romanian,RO,ROU,642
Russia,Russian,RU,RUS,643
Saudi Arabia,Saudi,SA,SAU,682
Scotland,Scottish,GB,GBR,826
Senegal,Senegalese,SN,SEN,686
Serbia,Serbian,RS,SRB,688
Singapore,Singaporean,SG,SGP,702
Slovakia,Slovak,SK,SVK,703
South Africa,South African,ZA,ZAF,710
South Korea,Korean,KR,KOR,410
Spain,Spanish,ES,ESP,724
Sri Lanka,Sri Lankan,LK,LKA,144
South Sudan,Sudanese,SS,SSD,728
Sudan,Sudanese,SD,SDN,729
Sweden,Swedish,SE,SWE,752
Switzerland,Swiss,CH,CHE,756
Syria,Syrian,SY,SYR,760
Taiwan,Taiwanese,TW,TWN,158
Tajikistan,Tajikistani,TJ,TJK,762
Thailand,Thai,TH,THA,764
Tonga,Tongan,TO,TON,776
Tunisia,Tunisian,TN,TUN,788
Turkey,Turkish,TR,TUR,792
Ukraine,Ukrainian,UA,UKR,804
United Arab Emirates,Emirati,AE,ARE,784
United Kingdom,British,GB,GBR,826
United States,American,US,USA,840
Uruguay,Uruguayan,UY,URY,858
Venezuela,Venezuelan,VE,VEN,862
Vietnam,Vietnamese,VN,VNM,704
Wales,Welsh,GB,GBR,826
Zambia,Zambian,ZM,ZMB,894
Zimbabwe,Zimbabwean,ZW,ZWE,716"

  ctry_data <- read.csv(text = data)

  if(!missing(country)){
    result <- ctry_data[ctry_data[['Country']] == country, ]$UN_code
  }else if(!missing(nationality)){
    result <- ctry_data[ctry_data[['Nationality']] == nationality, ]$UN_code
  }else if(!missing(alpha2)){
    result <- ctry_data[ctry_data[['Alpha2']] == alpha2, ]$UN_code
  }else if(!missing(alpha3)){
    result <- ctry_data[ctry_data[['Alpha3']] == alpha3, ]$UN_code
  }

  if(length(result) == 0){
    result <- 'Unknown'
  }

  return(result)
}
