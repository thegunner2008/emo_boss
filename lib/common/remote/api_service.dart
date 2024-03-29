import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/remote/remote.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/login")
  Future<LoginResponse> login(
    @Body() Map<String, dynamic> request,
  );

  @POST("/register")
  Future<SignUpResponse> signup(
    @Body() Map<String, dynamic> request,
  );

  @POST("/logout")
  Future logout();

  @GET("/users/me")
  Future<User> getUser();

  //job
  @GET("jobs")
  Future<ResponseList<Job>> getJobs({
    @Query("page_size") int pageSize = 20,
    @Query("page") int page = 1,
    @Query("sort_by") String sort = "id",
    @Query("order") String order = "desc",
  });

  @POST("jobs")
  Future createJobs({
    @Body() required Map<String, dynamic> request,
  });

  @PUT("jobs/{job_id}")
  Future editJobs({
    @Path("job_id") required int id,
    @Body() required Map<String, dynamic> request,
  });

  @DELETE("jobs")
  Future deleteJobs({
    @Query("job_id") required int id,
  });

  @GET("/withdraws/all")
  Future<ResponseList<Withdraw>> getWithdraws({
    @Query("page_size") int pageSize = 20,
    @Query("page") int page = 1,
    @Query("sort_by") String sort = "id",
    @Query("order") String order = "desc",
  });

  @POST("/withdraws")
  Future postWithdraw(
    @Body() Map<String, dynamic> request,
  );

  @POST("/withdraws/pay")
  Future payWithdraw(
    @Body() Map<String, dynamic> request,
  );

  @GET("/users")
  Future<ResponseList<UserTotal>> getUsers({
    @Query("page_size") int pageSize = 20,
    @Query("page") int page = 1,
    @Query("sort_by") String sort = "id",
    @Query("order") String order = "desc",
  });

  @GET("/users/{user_id}")
  Future<UserTotal> getUserPlus({
    @Path("user_id") required int userId,
  });

  /// Always show error with snackBar,
  /// if you want to handle error by yourself:
  ///
  /// Declare showDefaultError = false and handle Error with catchError
  static ApiService create({bool showDefaultError = true}) =>
      ApiService(DioManager.getDio(showDefaultError: showDefaultError));
}
