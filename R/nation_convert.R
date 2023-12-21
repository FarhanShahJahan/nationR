#' Convert input to any target value inserted
#'
#' This function takes input that can be Country, Nationality, Alpha2, Alpha3, UN_code and to be transformed to be any of them
#'
#' @param origin category of original data
#' @param target category of target data
#' @param origin_data Vector of data that wanted to be transformed
#'
#' @author Farhan Shah Jahan
#'
#' @return Vector of corresponding country names
#' @examples
#' country_list <- c('India', 'Malaysia', 'Canada')
#' nation_convert(origin = 'Country', target = 'UN_code', origin_data = country_list)
#' @export
#'
nation_convert <- function(origin, target, origin_data) {
  library(dplyr)

  data <- "Country,Nationality,Alpha2,Alpha3,UN_code
  Afghanistan,Afghan,AF,AFG,004
  Åland Islands,Åland Island,AX,ALA,248
  Albania,Albanian,AL,ALB,008
  Algeria,Algerian,DZ,DZA,012
  American Samoa,American Samoan,AS,ASM,016
  Andorra,Andorran,AD,AND,020
  Angola,Angolan,AO,AGO,024
  Anguilla,Anguillan,AI,AIA,660
  Antarctica,Of Antarctica,AQ,ATA,010
  Antigua and Barbuda,Antiguan or Barbudan,AG,ATG,028
  Argentina,Argentinian,AR,ARG,032
  Armenia,Armenian,AM,ARM,051
  Aruba,Aruban,AW,ABW,533
  Australia,Australian,AU,AUS,036
  Austria,Austrian,AT,AUT,040
  Azerbaijan,Azerbaijani,AZ,AZE,031
  Bahamas,Bahamian,BS,BHS,044
  Bahrain,Bahraini,BH,BHR,048
  Bangladesh,Bangladeshi,BD,BGD,050
  Barbados,Barbadian,BB,BRB,052
  Belarus,Belarusian,BY,BLR,112
  Belgium,Belgian,BE,BEL,056
  Belize,Belizean,BZ,BLZ,084
  Benin,Beninese,BJ,BEN,204
  Bermuda,Bermudian,BM,BMU,060
  Bhutan,Bhutanese,BT,BTN,064
  Bolivia (Plurinational State of),Bolivian,BO,BOL,068
  Bonaire,Bonaire,BQ,BES,535
  Bosnia and Herzegovina,Bosnian or Herzegovinian,BA,BIH,070
  Botswana,Botswanan,BW,BWA,072
  Bouvet Island,Bouvet Island,BV,BVT,074
  Brazil,Brazilian,BR,BRA,076
  British Indian Ocean Territory,BIOT,IO,IOT,086
  Brunei Darussalam,Bruneian,BN,BRN,096
  Bulgaria,Bulgarian,BG,BGR,100
  Burkina Faso,Burkinabé,BF,BFA,854
  Burundi,Burundian,BI,BDI,108
  Cabo Verde,Cabo Verdean,CV,CPV,132
  Cambodia,Cambodian,KH,KHM,116
  Cameroon,Cameroonian,CM,CMR,120
  Canada,Canadian,CA,CAN,124
  Cayman Islands,Caymanian,KY,CYM,136
  Central African Republic,Central African,CF,CAF,140
  Chad,Chadian,TD,TCD,148
  Chile,Chilean,CL,CHL,152
  China,Chinese,CN,CHN,156
  Christmas Island,Christmas Island,CX,CXR,162
  Cocos (Keeling) Islands,Cocos Island,CC,CCK,166
  Colombia,Colombian,CO,COL,170
  Comoros,Comoran,KM,COM,174
  Republic of the Congo,Congolese ROC,CG,COG,178
  Democratic Republic of the Congo,Congolese,CD,COD,180
  Cook Islands,Cook Island,CK,COK,184
  Costa Rica,Costa Rican,CR,CRI,188
  Côte d\'Ivoire,Ivorian,CI,CIV,384
  Croatia,Croatian,HR,HRV,191
  Cuba,Cuban,CU,CUB,192
  Curaçao,Curaçaoan,CW,CUW,531
  Cyprus,Cypriot,CY,CYP,196
  Czech Republic,Czech,CZ,CZE,203
  Denmark,Danish,DK,DNK,208
  Djibouti,Djiboutian,DJ,DJI,262
  Dominica,Dominican,DM,DMA,212
  Dominican Republic,Dominican,DO,DOM,214
  Ecuador,Ecuadorian,EC,ECU,218
  Egypt,Egyptian,EG,EGY,818
  El Salvador,Salvadoran,SV,SLV,222
  Equatorial Guinea,Equatorial Guinean,GQ,GNQ,226
  Eritrea,Eritrean,ER,ERI,232
  Estonia,Estonian,EE,EST,233
  Ethiopia,Ethiopian,ET,ETH,231
  Falkland Islands (Malvinas),Falkland Island,FK,FLK,238
  Faroe Islands,Faroese,FO,FRO,234
  Fiji,Fijian,FJ,FJI,242
  Finland,Finnish,FI,FIN,246
  France,French,FR,FRA,250
  French Guiana,French Guianese,GF,GUF,254
  French Polynesia,French Polynesian,PF,PYF,258
  French Southern Territories,French Southern Territories,TF,ATF,260
  Gabon,Gabonese,GA,GAB,266
  Gambia,Gambian,GM,GMB,270
  Georgia,Georgian,GE,GEO,268
  Germany,German,DE,DEU,276
  Ghana,Ghanaian,GH,GHA,288
  Gibraltar,Gibraltar,GI,GIB,292
  Greece,Greek,GR,GRC,300
  Greenland,Greenlandic,GL,GRL,304
  Grenada,Grenadian,GD,GRD,308
  Guadeloupe,Guadeloupe,GP,GLP,312
  Guam,Guamanian,GU,GUM,316
  Guatemala,Guatemalan,GT,GTM,320
  Guernsey,Channel Island,GG,GGY,831
  Guinea,Guinean,GN,GIN,324
  Guinea-Bissau,Bissau-Guinean,GW,GNB,624
  Guyana,Guyanese,GY,GUY,328
  Haiti,Haitian,HT,HTI,332
  Heard Island and McDonald Islands,Heard Island or McDonald Islands,HM,HMD,334
  Vatican City State,Vatican,VA,VAT,336
  Honduras,Honduran,HN,HND,340
  Hong Kong,Hong Kong Chinese,HK,HKG,344
  Hungary,Hungarian,HU,HUN,348
  Iceland,Icelander,IS,ISL,352
  India,Indian,IN,IND,356
  Indonesia,Indonesian,ID,IDN,360
  Iran,Iranian,IR,IRN,364
  Iraq,Iraqi,IQ,IRQ,368
  Ireland,Irish,IE,IRL,372
  Isle of Man,Manx,IM,IMN,833
  Israel,Israeli,IL,ISR,376
  Italy,Italian,IT,ITA,380
  Jamaica,Jamaican,JM,JAM,388
  Japan,Japanese,JP,JPN,392
  Jersey,Channel Island,JE,JEY,832
  Jordan,Jordanian,JO,JOR,400
  Kazakhstan,Kazakh,KZ,KAZ,398
  Kenya,Kenyan,KE,KEN,404
  Kiribati,I-Kiribati,KI,KIR,296
  Korea (Democratic People\'s Republic of),North Korean,KP,PRK,408
  Korea (Republic of),South Korean,KR,KOR,410
  Kuwait,Kuwaiti,KW,KWT,414
  Kyrgyzstan,Kyrgyzstani,Kyrgyz,Kirgiz,Kirghiz,KG,KGZ,417
  Laos,Lao,LA,LAO,418
  Latvia,Latvian,LV,LVA,428
  Lebanon,Lebanese,LB,LBN,422
  Lesotho,Basotho,LS,LSO,426
  Liberia,Liberian,LR,LBR,430
  Libya,Libyan,LY,LBY,434
  Liechtenstein,Liechtenstein,LI,LIE,438
  Lithuania,Lithuanian,LT,LTU,440
  Luxembourg,Luxembourgish,LU,LUX,442
  Macao,Macanese,MO,MAC,446
  Macedonia (the former Yugoslav Republic of),Macedonian,MK,MKD,807
  Madagascar,Malagasy,MG,MDG,450
  Malawi,Malawian,MW,MWI,454
  Malaysia,Malaysian,MY,MYS,458
  Maldives,Maldivian,MV,MDV,462
  Mali,Malian,ML,MLI,466
  Malta,Maltese,MT,MLT,470
  Marshall Islands,Marshallese,MH,MHL,584
  Martinique,Martinican,MQ,MTQ,474
  Mauritania,Mauritanian,MR,MRT,478
  Mauritius,Mauritian,MU,MUS,480
  Mayotte,Mahoran,YT,MYT,175
  Mexico,Mexican,MX,MEX,484
  Micronesia (Federated States of),Micronesian,FM,FSM,583
  Moldova (Republic of),Moldovan,MD,MDA,498
  Monaco,Monégasque,MC,MCO,492
  Mongolia,Mongolian,MN,MNG,496
  Montenegro,Montenegrin,ME,MNE,499
  Montserrat,Montserratian,MS,MSR,500
  Morocco,Moroccan,MA,MAR,504
  Mozambique,Mozambican,MZ,MOZ,508
  Myanmar,Burmese,MM,MMR,104
  Namibia,Namibian,NA,NAM,516
  Nauru,Nauruan,NR,NRU,520
  Nepal,Nepalese,NP,NPL,524
  Netherlands,Dutch,NL,NLD,528
  New Caledonia,New Caledonian,NC,NCL,540
  New Zealand,New Zealander,NZ,NZL,554
  Nicaragua,Nicaraguan,NI,NIC,558
  Niger,Nigerien,NE,NER,562
  Nigeria,Nigerian,NG,NGA,566
  Niue,Niuean,NU,NIU,570
  Norfolk Island,Norfolk Island,NF,NFK,574
  Northern Mariana Islands,Northern Marianan,MP,MNP,580
  Norway,Norwegian,NO,NOR,578
  Oman,Omani,OM,OMN,512
  Pakistan,Pakistani,PK,PAK,586
  Palau,Palauan,PW,PLW,585
  Palestine,Palestinian,PS,PSE,275
  Panama,Panamanian,PA,PAN,591
  Papua New Guinea,Papua New Guinean,PG,PNG,598
  Paraguay,Paraguayan,PY,PRY,600
  Peru,Peruvian,PE,PER,604
  Philippines,Filipino,PH,PHL,608
  Pitcairn,Pitcairn Island,PN,PCN,612
  Poland,Polish,PL,POL,616
  Portugal,Portuguese,PT,PRT,620
  Puerto Rico,Puerto Rican,PR,PRI,630
  Qatar,Qatari,QA,QAT,634
  Réunion,Réunionese,RE,REU,638
  Romania,Romanian,RO,ROU,642
  Russian Federation,Russian,RU,RUS,643
  Rwanda,Rwandan; Rwandese,RW,RWA,646
  Saint Barthélemy,Barthélemois,BL,BLM,652
  Saint Helena,Saint Helenian,SH,SHN,654
  Ascension and Tristan da Cunha,Saint Helenian,SH,SHN,654
  Saint Kitts and Nevis,Kittitian or Nevisian,KN,KNA,659
  Saint Lucia,Saint Lucian,LC,LCA,662
  Saint Martin (French part),Saint-Martinoise,MF,MAF,663
  Saint Pierre and Miquelon,Saint-Pierrais or Miquelonnais,PM,SPM,666
  Samoa,Samoan,WS,WSM,882
  San Marino,Sammarinese,SM,SMR,674
  Sao Tome and Principe,São Toméan,ST,STP,678
  Saudi Arabia,Saudi Arabian,SA,SAU,682
  Senegal,Senegalese,SN,SEN,686
  Serbia,Serb,RS,SRB,688
  Seychelles,Seychellois,SC,SYC,690
  Sierra Leone,Sierra Leonean,SL,SLE,694
  Singapore,Singaporean,SG,SGP,702
  Sint Maarten (Dutch part),Sint Maarten,SX,SXM,534
  Slovenia,Slovenian,SI,SVN,705
  Solomon Islands,Solomon Island,SB,SLB,90
  Somalia,Somali,SO,SOM,706
  South Africa,South African,ZA,ZAF,710
  South Georgia and the South Sandwich Islands,South Georgia or South Sandwich Islands,GS,SGS,239
  South Sudan,South Sudanese,SS,SSD,728
  Spain,Spaniard,ES,ESP,724
  Sri Lanka,Sri Lankan,LK,LKA,144
  Sudan,Sudanese,SD,SDN,729
  Suriname,Surinamese,SR,SUR,740
  Svalbard and Jan Mayen,Svalbard,SJ,SJM,744
  Swaziland,Swazi,SZ,SWZ,748
  Sweden,Swedish,SE,SWE,752
  Switzerland,Swiss,CH,CHE,756
  Syrian Arab Republic,Syrian,SY,SYR,760
  Taiwan,Taiwanese,TW,TWN,158
  Tajikistan,Tajikistani,TJ,TJK,762
  Tanzania,Tanzanian,TZ,TZA,834
  Thailand,Thai,TH,THA,764
  Timor-Leste,Timorese,TL,TLS,626
  Togo,Togolese,TG,TGO,768
  Tokelau,Tokelauan,TK,TKL,772
  Tonga,Tongan,TO,TON,776
  Trinidad and Tobago,Trinidadian or Tobagonian,TT,TTO,780
  Tunisia,Tunisian,TN,TUN,788
  Turkey,Turk,TR,TUR,792
  Turkmenistan,Turkmen,TM,TKM,795
  Turks and Caicos Islands,Turks and Caicos Island,TC,TCA,796
  Tuvalu,Tuvaluan,TV,TUV,798
  Uganda,Ugandan,UG,UGA,800
  Ukraine,Ukrainian,UA,UKR,804
  United Arab Emirates,Emirian,AE,ARE,784
  United Kingdom,British,GB,GBR,826
  United States of America,American,US,USA,840
  Uruguay,Uruguayan,UY,URY,858
  Uzbekistan,Uzbek,UZ,UZB,860
  Vanuatu,Ni-Vanuatu,VU,VUT,548
  Venezuela (Bolivarian Republic of),Venezuelan,VE,VEN,862
  Vietnam,Vietnamese,VN,VNM,704
  Virgin Islands (British),British Virgin Island,VG,VGB,92
  Virgin Islands (U.S.),US Virgin Islander,VI,VIR,850
  Wallis and Futuna,Wallisian and Futunans,WF,WLF,876
  Western Sahara,Sahrawi,EH,ESH,732
  Yemen,Yemeni,YE,YEM,887
  Zambia,Zambian,ZM,ZMB,894
  Zimbabwe,Zimbabwean,ZW,ZWE,716"

  # cause prob
  # Lao People\'s Democratic Republic,Lao,LA,LAO,418

  ctry_data <- read.csv(text = data)

  if(!is.data.frame(origin_data)){
    origin_data <- unlist(origin_data) #if the input is list()
    origin_data <- data.frame(origin = origin_data)
  }

  names(origin_data) <- origin

  result <- left_join(origin_data, ctry_data, by = origin)

  if(length(result) == 0){
    result <- 'Unknown'
  }

  # result <- result[, target]
  if (target == 'Country') {
    return(result$Country)
  }else if (target == 'Nationality') {
    return(result$Nationality)
  }else if (target == 'Alpha2') {
    return(result$Alpha2)
  }else if (target == 'Alpha3') {
    return(result$Alpha3)
  }else{
    return(result$UN_code)
  }
}

