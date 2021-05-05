// To parse this JSON data, do
//
//     final weatherResponseModel = weatherResponseModelFromJson(jsonString);

import 'dart:convert';

WeatherResponseModel weatherResponseModelFromJson(String str) => WeatherResponseModel.fromJson(json.decode(str));

String weatherResponseModelToJson(WeatherResponseModel data) => json.encode(data.toJson());

class WeatherResponseModel {
    WeatherResponseModel({
        this.data,
        this.cityName,
        this.lon,
        this.timezone,
        this.lat,
        this.countryCode,
        this.stateCode,
    });

    final List<Datum> data;
    final String cityName;
    final double lon;
    final String timezone;
    final double lat;
    final String countryCode;
    final String stateCode;

    factory WeatherResponseModel.fromJson(Map<String, dynamic> json) => WeatherResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        cityName: json["city_name"],
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        lat: json["lat"].toDouble(),
        countryCode: json["country_code"],
        stateCode: json["state_code"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "city_name": cityName,
        "lon": lon,
        "timezone": timezone,
        "lat": lat,
        "country_code": countryCode,
        "state_code": stateCode,
    };
}

class Datum {
    Datum({
        this.moonriseTs,
        this.windCdir,
        this.rh,
        this.pres,
        this.highTemp,
        this.sunsetTs,
        this.ozone,
        this.moonPhase,
        this.windGustSpd,
        this.snowDepth,
        this.clouds,
        this.ts,
        this.sunriseTs,
        this.appMinTemp,
        this.windSpd,
        this.pop,
        this.windCdirFull,
        this.slp,
        this.moonPhaseLunation,
        this.validDate,
        this.appMaxTemp,
        this.vis,
        this.dewpt,
        this.snow,
        this.uv,
        this.weather,
        this.windDir,
        this.maxDhi,
        this.cloudsHi,
        this.precip,
        this.lowTemp,
        this.maxTemp,
        this.moonsetTs,
        this.datetime,
        this.temp,
        this.minTemp,
        this.cloudsMid,
        this.cloudsLow,
    });

    final int moonriseTs;
    final String windCdir;
    final int rh;
    final double pres;
    final double highTemp;
    final int sunsetTs;
    final double ozone;
    final double moonPhase;
    final double windGustSpd;
    final int snowDepth;
    final int clouds;
    final int ts;
    final int sunriseTs;
    final double appMinTemp;
    final double windSpd;
    final int pop;
    final String windCdirFull;
    final double slp;
    final double moonPhaseLunation;
    final DateTime validDate;
    final double appMaxTemp;
    final double vis;
    final double dewpt;
    final int snow;
    final double uv;
    final Weather weather;
    final int windDir;
    final dynamic maxDhi;
    final int cloudsHi;
    final int precip;
    final double lowTemp;
    final double maxTemp;
    final int moonsetTs;
    final DateTime datetime;
    final double temp;
    final double minTemp;
    final int cloudsMid;
    final int cloudsLow;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        moonriseTs: json["moonrise_ts"],
        windCdir: json["wind_cdir"],
        rh: json["rh"],
        pres: json["pres"].toDouble(),
        highTemp: json["high_temp"].toDouble(),
        sunsetTs: json["sunset_ts"],
        ozone: json["ozone"].toDouble(),
        moonPhase: json["moon_phase"].toDouble(),
        windGustSpd: json["wind_gust_spd"].toDouble(),
        snowDepth: json["snow_depth"],
        clouds: json["clouds"],
        ts: json["ts"],
        sunriseTs: json["sunrise_ts"],
        appMinTemp: json["app_min_temp"].toDouble(),
        windSpd: json["wind_spd"].toDouble(),
        pop: json["pop"],
        windCdirFull: json["wind_cdir_full"],
        slp: json["slp"].toDouble(),
        moonPhaseLunation: json["moon_phase_lunation"].toDouble(),
        validDate: DateTime.parse(json["valid_date"]),
        appMaxTemp: json["app_max_temp"].toDouble(),
        vis: json["vis"].toDouble(),
        dewpt: json["dewpt"].toDouble(),
        snow: json["snow"],
        uv: json["uv"].toDouble(),
        weather: Weather.fromJson(json["weather"]),
        windDir: json["wind_dir"],
        maxDhi: json["max_dhi"],
        cloudsHi: json["clouds_hi"],
        precip: json["precip"],
        lowTemp: json["low_temp"].toDouble(),
        maxTemp: json["max_temp"].toDouble(),
        moonsetTs: json["moonset_ts"],
        datetime: DateTime.parse(json["datetime"]),
        temp: json["temp"].toDouble(),
        minTemp: json["min_temp"].toDouble(),
        cloudsMid: json["clouds_mid"],
        cloudsLow: json["clouds_low"],
    );

    Map<String, dynamic> toJson() => {
        "moonrise_ts": moonriseTs,
        "wind_cdir": windCdir,
        "rh": rh,
        "pres": pres,
        "high_temp": highTemp,
        "sunset_ts": sunsetTs,
        "ozone": ozone,
        "moon_phase": moonPhase,
        "wind_gust_spd": windGustSpd,
        "snow_depth": snowDepth,
        "clouds": clouds,
        "ts": ts,
        "sunrise_ts": sunriseTs,
        "app_min_temp": appMinTemp,
        "wind_spd": windSpd,
        "pop": pop,
        "wind_cdir_full": windCdirFull,
        "slp": slp,
        "moon_phase_lunation": moonPhaseLunation,
        "valid_date": "${validDate.year.toString().padLeft(4, '0')}-${validDate.month.toString().padLeft(2, '0')}-${validDate.day.toString().padLeft(2, '0')}",
        "app_max_temp": appMaxTemp,
        "vis": vis,
        "dewpt": dewpt,
        "snow": snow,
        "uv": uv,
        "weather": weather.toJson(),
        "wind_dir": windDir,
        "max_dhi": maxDhi,
        "clouds_hi": cloudsHi,
        "precip": precip,
        "low_temp": lowTemp,
        "max_temp": maxTemp,
        "moonset_ts": moonsetTs,
        "datetime": "${datetime.year.toString().padLeft(4, '0')}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')}",
        "temp": temp,
        "min_temp": minTemp,
        "clouds_mid": cloudsMid,
        "clouds_low": cloudsLow,
    };
}

class Weather {
    Weather({
        this.icon,
        this.code,
        this.description,
    });

    final String icon;
    final int code;
    final String description;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        icon: json["icon"],
        code: json["code"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "icon": icon,
        "code": code,
        "description": description,
    };
}
