//配置测试生产环境文件
import 'dev.dart';
import 'test.dart';

const envIsDev = dev == "dev";
const envHost = envIsDev ? devHost : testHost;
const envTitle = envIsDev ? devTitle : testTitle;
const envAccuWeatherBaseUrl = envIsDev ? devblogAccuWeatherBaseUrl : testblogAccuWeatherBaseUrl;
const envScienceOnlineOneDrive = envIsDev ? devblogScienceOnlineOneDraive : testblogScienceOnlineOneDraive;
const envSciJson = envIsDev ? devSciJson : testSciJson;
const envPersonJson = envIsDev ? devPersonJson : testPersonJson;
const envblogAccuWeatherKey = envIsDev ? devblogAccuWeatherKey : testblogAccuWeatherKey;