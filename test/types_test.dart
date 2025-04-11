import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'metadata/input_types.dart';

void main() {
  for (final displayName in FlutterCoreImageFilters.availableFilters) {
    final configuration = FlutterCoreImageFilters.createFilter(
      displayName: displayName,
    );
    bool noParams = displayName.contains('Lookup Table');
    if (noParams) {
      continue;
    }
    final params = configuration.parameters;
    for (final param in params) {
      test('param type ${param.name} of `${configuration.name}`', () {
        final paramValues = kInputTypes[configuration.name];
        expect(
          paramValues,
          isNotNull,
          reason: '${param.name} in ${configuration.name}',
        );
        final String? type = paramValues?[param.name];
        expect(
          type,
          isNotNull,
          reason: '${param.name} in ${configuration.name}',
        );
        if (param is CIImageParameter) {
          expect(
            type == 'CIAttributeTypeImage' || type == 'CIAttributeTypeGradient',
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is NSDataParameter ||
            param is CubeDataParameter ||
            param is NSStringParameter) {
          expect(
            type?.isEmpty,
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is NSBoolParameter) {
          expect(
            type == 'CIAttributeTypeBoolean' || type?.isEmpty == true,
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is CGAffineTransformParameter) {
          expect(
            type == 'CIAttributeTypeTransform',
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is CGColorSpaceParameter) {
          expect(
            type?.isEmpty,
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is CGPositionParameter) {
          expect(
            type == 'CIAttributeTypePosition' ||
                type == 'CIAttributeTypeOffset',
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is CGRectParameter) {
          expect(
            type == 'CIAttributeTypeRectangle',
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is CIColorParameter) {
          expect(
            type == 'CIAttributeTypeOpaqueColor' ||
                type == 'CIAttributeTypeColor',
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is Mat3Parameter) {
          expect(
            type?.isEmpty == true || type == 'CIAttributeTypePosition3',
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is Mat5Parameter) {
          expect(
            type?.isEmpty == true || type == 'CIAttributeTypePosition3',
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is Mat7Parameter) {
          expect(
            type?.isEmpty == true || type == 'CIAttributeTypePosition3',
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is CIVectorParameter) {
          expect(
            type?.isEmpty == true || type == 'CIAttributeTypePosition3',
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is NSNumberParameter) {
          expect(
            type?.isEmpty == true ||
                type == 'CIAttributeTypeScalar' ||
                type == 'CIAttributeTypeAngle',
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else if (param is SliderNSNumberParameter) {
          expect(
            type?.isEmpty == true ||
                type == 'CIAttributeTypeScalar' ||
                type == 'CIAttributeTypeAngle' ||
                type == 'CIAttributeTypeTime' ||
                type == 'CIAttributeTypeDistance',
            true,
            reason: '${param.name} in ${configuration.name} $type',
          );
        } else if (param is SliderNSIntegerParameter) {
          expect(
            type == 'CIAttributeTypeInteger' || type == 'CIAttributeTypeCount',
            true,
            reason: '${param.name} in ${configuration.name}',
          );
        } else {
          fail('${param.name} in ${configuration.name} not matched with $type');
        }
      });
    }
  }
}
