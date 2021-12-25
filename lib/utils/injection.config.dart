// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'services/package_service.dart' as _i3;
import 'services/web_service.dart' as _i4;

const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.Packager>(() => _i3.EpubPackager(),
      instanceName: 'EpubPackager');
  gh.factory<_i4.WebService>(() => _i4.WebServiceProd(), registerFor: {_prod});
  gh.factory<_i4.WebService>(() => _i4.WebServiceDev(), registerFor: {_dev});
  return get;
}
