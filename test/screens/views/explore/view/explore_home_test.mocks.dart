// Mocks generated by Mockito 5.4.5 from annotations
// in cypt_block/test/screens/views/explore/view/explore_home_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;
import 'dart:ui' as _i8;

import 'package:cypt_block/core/model/blocks_model/block_transaction_model.dart'
    as _i5;
import 'package:cypt_block/core/model/blocks_model/latest_block_model.dart'
    as _i4;
import 'package:cypt_block/core/services/myservices.dart' as _i9;
import 'package:cypt_block/screens/views/explore/view_model/explore_view_model.dart'
    as _i7;
import 'package:cypt_block/utils/progressBarManager/dialog_models.dart' as _i3;
import 'package:cypt_block/utils/router/navigation_service.dart' as _i2;
import 'package:flutter/material.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNavigationService_0 extends _i1.SmartFake
    implements _i2.NavigationService {
  _FakeNavigationService_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeProgressResponse_1 extends _i1.SmartFake
    implements _i3.ProgressResponse {
  _FakeProgressResponse_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeLatestBlockModel_2 extends _i1.SmartFake
    implements _i4.LatestBlockModel {
  _FakeLatestBlockModel_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeBlockTransactionModel_3 extends _i1.SmartFake
    implements _i5.BlockTransactionModel {
  _FakeBlockTransactionModel_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeGlobalKey_4<T extends _i6.State<_i6.StatefulWidget>>
    extends _i1.SmartFake
    implements _i6.GlobalKey<T> {
  _FakeGlobalKey_4(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ExploreViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockExploreViewModel extends _i1.Mock implements _i7.ExploreViewModel {
  MockExploreViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NavigationService get navigationService =>
      (super.noSuchMethod(
            Invocation.getter(#navigationService),
            returnValue: _FakeNavigationService_0(
              this,
              Invocation.getter(#navigationService),
            ),
          )
          as _i2.NavigationService);

  @override
  _i3.ProgressResponse get hh =>
      (super.noSuchMethod(
            Invocation.getter(#hh),
            returnValue: _FakeProgressResponse_1(this, Invocation.getter(#hh)),
          )
          as _i3.ProgressResponse);

  @override
  set hh(_i3.ProgressResponse? _hh) => super.noSuchMethod(
    Invocation.setter(#hh, _hh),
    returnValueForMissingStub: null,
  );

  @override
  bool get busy =>
      (super.noSuchMethod(Invocation.getter(#busy), returnValue: false)
          as bool);

  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);

  @override
  dynamic getTransactionList(_i6.BuildContext? context) =>
      super.noSuchMethod(Invocation.method(#getTransactionList, [context]));

  @override
  void setBusy(bool? value) => super.noSuchMethod(
    Invocation.method(#setBusy, [value]),
    returnValueForMissingStub: null,
  );

  @override
  void addListener(_i8.VoidCallback? listener) => super.noSuchMethod(
    Invocation.method(#addListener, [listener]),
    returnValueForMissingStub: null,
  );

  @override
  void removeListener(_i8.VoidCallback? listener) => super.noSuchMethod(
    Invocation.method(#removeListener, [listener]),
    returnValueForMissingStub: null,
  );

  @override
  void dispose() => super.noSuchMethod(
    Invocation.method(#dispose, []),
    returnValueForMissingStub: null,
  );

  @override
  void notifyListeners() => super.noSuchMethod(
    Invocation.method(#notifyListeners, []),
    returnValueForMissingStub: null,
  );
}

/// A class which mocks [MyServices].
///
/// See the documentation for Mockito's code generation for more information.
class MockMyServices extends _i1.Mock implements _i9.MyServices {
  MockMyServices() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.LatestBlockModel get latestBlockModel =>
      (super.noSuchMethod(
            Invocation.getter(#latestBlockModel),
            returnValue: _FakeLatestBlockModel_2(
              this,
              Invocation.getter(#latestBlockModel),
            ),
          )
          as _i4.LatestBlockModel);

  @override
  _i5.BlockTransactionModel get blockTransactionModel =>
      (super.noSuchMethod(
            Invocation.getter(#blockTransactionModel),
            returnValue: _FakeBlockTransactionModel_3(
              this,
              Invocation.getter(#blockTransactionModel),
            ),
          )
          as _i5.BlockTransactionModel);

  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);

  @override
  _i10.Future<dynamic> getLatestBlock() =>
      (super.noSuchMethod(
            Invocation.method(#getLatestBlock, []),
            returnValue: _i10.Future<dynamic>.value(),
          )
          as _i10.Future<dynamic>);

  @override
  _i10.Future<dynamic> transactions(String? blockHash) =>
      (super.noSuchMethod(
            Invocation.method(#transactions, [blockHash]),
            returnValue: _i10.Future<dynamic>.value(),
          )
          as _i10.Future<dynamic>);

  @override
  void addListener(_i8.VoidCallback? listener) => super.noSuchMethod(
    Invocation.method(#addListener, [listener]),
    returnValueForMissingStub: null,
  );

  @override
  void removeListener(_i8.VoidCallback? listener) => super.noSuchMethod(
    Invocation.method(#removeListener, [listener]),
    returnValueForMissingStub: null,
  );

  @override
  void dispose() => super.noSuchMethod(
    Invocation.method(#dispose, []),
    returnValueForMissingStub: null,
  );

  @override
  void notifyListeners() => super.noSuchMethod(
    Invocation.method(#notifyListeners, []),
    returnValueForMissingStub: null,
  );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i2.NavigationService {
  MockNavigationService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.GlobalKey<_i6.NavigatorState> get navigationKey =>
      (super.noSuchMethod(
            Invocation.getter(#navigationKey),
            returnValue: _FakeGlobalKey_4<_i6.NavigatorState>(
              this,
              Invocation.getter(#navigationKey),
            ),
          )
          as _i6.GlobalKey<_i6.NavigatorState>);

  @override
  _i10.Future<dynamic> navigateTo(String? routeName, {dynamic arguments}) =>
      (super.noSuchMethod(
            Invocation.method(
              #navigateTo,
              [routeName],
              {#arguments: arguments},
            ),
            returnValue: _i10.Future<dynamic>.value(),
          )
          as _i10.Future<dynamic>);

  @override
  _i10.Future<dynamic> navigateReplacementTo(
    String? routeName, {
    dynamic arguments,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #navigateReplacementTo,
              [routeName],
              {#arguments: arguments},
            ),
            returnValue: _i10.Future<dynamic>.value(),
          )
          as _i10.Future<dynamic>);

  @override
  _i10.Future<dynamic> navigateandRemoveRoute(String? routeName) =>
      (super.noSuchMethod(
            Invocation.method(#navigateandRemoveRoute, [routeName]),
            returnValue: _i10.Future<dynamic>.value(),
          )
          as _i10.Future<dynamic>);
}
