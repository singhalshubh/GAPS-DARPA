; ModuleID = './partitioned/multithreaded/orange/orange_rpc.c'
source_filename = "./partitioned/multithreaded/orange/orange_rpc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._tag = type { i32, i32, i32 }
%struct._nextrpc_datatype = type { i32, i32, i32, %struct._trailer_datatype }
%struct._trailer_datatype = type { i32, i32, i32, i16, i16 }
%struct._okay_datatype = type { i32, %struct._trailer_datatype }
%struct._request_get_a_datatype = type { i32, %struct._trailer_datatype }
%struct._response_get_a_datatype = type { double, %struct._trailer_datatype }
%union.pthread_attr_t = type { i64, [48 x i8] }

@_handle_nextrpc.inited = internal global i32 0, align 4, !dbg !0
@_handle_nextrpc.psocket = internal global i8* null, align 8, !dbg !26
@_handle_nextrpc.ssocket = internal global i8* null, align 8, !dbg !29
@.str = private unnamed_addr constant [12 x i8] c"TAG_NEXTRPC\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [48 x i8] c"./partitioned/multithreaded/orange/orange_rpc.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [9 x i8] c"TAG_OKAY\00", section "llvm.metadata"
@_handle_request_get_a.inited = internal global i32 0, align 4, !dbg !31
@_handle_request_get_a.psocket = internal global i8* null, align 8, !dbg !35
@_handle_request_get_a.ssocket = internal global i8* null, align 8, !dbg !37
@_handle_request_get_a.processed_counter = internal global i32 0, align 4, !dbg !39
@_handle_request_get_a.last_processed_result = internal global double 0.000000e+00, align 8, !dbg !41
@_handle_request_get_a.last_processed_error = internal global i32 0, align 4, !dbg !44
@.str.3 = private unnamed_addr constant [18 x i8] c"TAG_REQUEST_GET_A\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [19 x i8] c"TAG_RESPONSE_GET_A\00", section "llvm.metadata"
@.str.5 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_suborange\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_puborange\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_hal_init(i8* %0, i8* %1) #0 !dbg !50 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !53, metadata !DIExpression()), !dbg !54
  store i8* %1, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !55, metadata !DIExpression()), !dbg !56
  %5 = load i8*, i8** %3, align 8, !dbg !57
  %6 = call i8* @xdc_set_in(i8* %5), !dbg !58
  %7 = load i8*, i8** %4, align 8, !dbg !59
  %8 = call i8* @xdc_set_out(i8* %7), !dbg !60
  call void @xdc_register(void (i8*, i8*, i64*)* @nextrpc_data_encode, void (i8*, i8*, i64*)* @nextrpc_data_decode, i32 1), !dbg !61
  call void @xdc_register(void (i8*, i8*, i64*)* @okay_data_encode, void (i8*, i8*, i64*)* @okay_data_decode, i32 2), !dbg !62
  call void @xdc_register(void (i8*, i8*, i64*)* @request_get_a_data_encode, void (i8*, i8*, i64*)* @request_get_a_data_decode, i32 3), !dbg !63
  call void @xdc_register(void (i8*, i8*, i64*)* @response_get_a_data_encode, void (i8*, i8*, i64*)* @response_get_a_data_decode, i32 4), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @xdc_set_in(i8*) #2

declare dso_local i8* @xdc_set_out(i8*) #2

declare dso_local void @xdc_register(void (i8*, i8*, i64*)*, void (i8*, i8*, i64*)*, i32) #2

declare dso_local void @nextrpc_data_encode(i8*, i8*, i64*) #2

declare dso_local void @nextrpc_data_decode(i8*, i8*, i64*) #2

declare dso_local void @okay_data_encode(i8*, i8*, i64*) #2

declare dso_local void @okay_data_decode(i8*, i8*, i64*) #2

declare dso_local void @request_get_a_data_encode(i8*, i8*, i64*) #2

declare dso_local void @request_get_a_data_decode(i8*, i8*, i64*) #2

declare dso_local void @response_get_a_data_encode(i8*, i8*, i64*) #2

declare dso_local void @response_get_a_data_decode(i8*, i8*, i64*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_handle_nextrpc(%struct._tag* %0) #0 !dbg !2 {
  %2 = alloca %struct._tag*, align 8
  %3 = alloca %struct._tag, align 1
  %4 = alloca %struct._tag, align 1
  %5 = alloca %struct._nextrpc_datatype, align 1
  %6 = alloca %struct._okay_datatype, align 1
  %7 = alloca { i64, i32 }, align 1
  store %struct._tag* %0, %struct._tag** %2, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata %struct._nextrpc_datatype* %5, metadata !72, metadata !DIExpression()), !dbg !95
  %8 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !96
  call void @llvm.var.annotation(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 169), !dbg !96
  call void @llvm.dbg.declare(metadata %struct._okay_datatype* %6, metadata !97, metadata !DIExpression()), !dbg !103
  %9 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !104
  call void @llvm.var.annotation(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 174), !dbg !104
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 1), !dbg !105
  %10 = load i32, i32* @_handle_nextrpc.inited, align 4, !dbg !106
  %11 = icmp ne i32 %10, 0, !dbg !106
  br i1 %11, label %22, label %12, !dbg !108

12:                                               ; preds = %1
  store i32 1, i32* @_handle_nextrpc.inited, align 4, !dbg !109
  %13 = call i8* @xdc_pub_socket(), !dbg !111
  store i8* %13, i8** @_handle_nextrpc.psocket, align 8, !dbg !112
  %14 = bitcast { i64, i32 }* %7 to i8*, !dbg !113
  %15 = bitcast %struct._tag* %3 to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %14, i8* align 1 %15, i64 12, i1 false), !dbg !113
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !113
  %17 = load i64, i64* %16, align 1, !dbg !113
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !113
  %19 = load i32, i32* %18, align 1, !dbg !113
  %20 = call i8* @xdc_sub_socket(i64 %17, i32 %19), !dbg !113
  store i8* %20, i8** @_handle_nextrpc.ssocket, align 8, !dbg !114
  %21 = call i32 @sleep(i32 1), !dbg !115
  br label %22, !dbg !116

22:                                               ; preds = %12, %1
  %23 = load i8*, i8** @_handle_nextrpc.ssocket, align 8, !dbg !117
  %24 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !118
  call void @xdc_blocking_recv(i8* %23, i8* %24, %struct._tag* %3), !dbg !119
  call void @tag_write(%struct._tag* %4, i32 1, i32 1, i32 2), !dbg !120
  %25 = getelementptr inbounds %struct._okay_datatype, %struct._okay_datatype* %6, i32 0, i32 0, !dbg !121
  store i32 0, i32* %25, align 1, !dbg !122
  %26 = load i8*, i8** @_handle_nextrpc.psocket, align 8, !dbg !123
  %27 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !124
  call void @xdc_asyn_send(i8* %26, i8* %27, %struct._tag* %4), !dbg !125
  %28 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 0, !dbg !126
  %29 = load i32, i32* %28, align 1, !dbg !126
  %30 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !127
  %31 = getelementptr inbounds %struct._tag, %struct._tag* %30, i32 0, i32 0, !dbg !128
  store i32 %29, i32* %31, align 1, !dbg !129
  %32 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 1, !dbg !130
  %33 = load i32, i32* %32, align 1, !dbg !130
  %34 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !131
  %35 = getelementptr inbounds %struct._tag, %struct._tag* %34, i32 0, i32 1, !dbg !132
  store i32 %33, i32* %35, align 1, !dbg !133
  %36 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 2, !dbg !134
  %37 = load i32, i32* %36, align 1, !dbg !134
  %38 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !135
  %39 = getelementptr inbounds %struct._tag, %struct._tag* %38, i32 0, i32 2, !dbg !136
  store i32 %37, i32* %39, align 1, !dbg !137
  ret void, !dbg !138
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #3

declare dso_local void @tag_write(%struct._tag*, i32, i32, i32) #2

declare dso_local i8* @xdc_pub_socket() #2

declare dso_local i8* @xdc_sub_socket(i64, i32) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local i32 @sleep(i32) #2

declare dso_local void @xdc_blocking_recv(i8*, i8*, %struct._tag*) #2

declare dso_local void @xdc_asyn_send(i8*, i8*, %struct._tag*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_handle_request_get_a(%struct._tag* %0) #0 !dbg !33 {
  %2 = alloca %struct._tag*, align 8
  %3 = alloca %struct._tag, align 1
  %4 = alloca %struct._tag, align 1
  %5 = alloca %struct._request_get_a_datatype, align 1
  %6 = alloca %struct._response_get_a_datatype, align 1
  %7 = alloca { i64, i32 }, align 1
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct._tag* %0, %struct._tag** %2, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %5, metadata !145, metadata !DIExpression()), !dbg !151
  %10 = bitcast %struct._request_get_a_datatype* %5 to i8*, !dbg !152
  call void @llvm.var.annotation(i8* %10, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 241), !dbg !152
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 3), !dbg !153
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %6, metadata !154, metadata !DIExpression()), !dbg !160
  %11 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !161
  call void @llvm.var.annotation(i8* %11, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 251), !dbg !161
  call void @tag_write(%struct._tag* %4, i32 1, i32 1, i32 4), !dbg !162
  %12 = load i32, i32* @_handle_request_get_a.inited, align 4, !dbg !163
  %13 = icmp ne i32 %12, 0, !dbg !163
  br i1 %13, label %24, label %14, !dbg !165

14:                                               ; preds = %1
  store i32 1, i32* @_handle_request_get_a.inited, align 4, !dbg !166
  %15 = call i8* @xdc_pub_socket(), !dbg !168
  store i8* %15, i8** @_handle_request_get_a.psocket, align 8, !dbg !169
  %16 = bitcast { i64, i32 }* %7 to i8*, !dbg !170
  %17 = bitcast %struct._tag* %3 to i8*, !dbg !170
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %16, i8* align 1 %17, i64 12, i1 false), !dbg !170
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !170
  %19 = load i64, i64* %18, align 1, !dbg !170
  %20 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !170
  %21 = load i32, i32* %20, align 1, !dbg !170
  %22 = call i8* @xdc_sub_socket(i64 %19, i32 %21), !dbg !170
  store i8* %22, i8** @_handle_request_get_a.ssocket, align 8, !dbg !171
  %23 = call i32 @sleep(i32 1), !dbg !172
  br label %24, !dbg !173

24:                                               ; preds = %14, %1
  %25 = load i8*, i8** @_handle_request_get_a.ssocket, align 8, !dbg !174
  %26 = bitcast %struct._request_get_a_datatype* %5 to i8*, !dbg !175
  call void @xdc_blocking_recv(i8* %25, i8* %26, %struct._tag* %3), !dbg !176
  call void @llvm.dbg.declare(metadata i32* %8, metadata !177, metadata !DIExpression()), !dbg !178
  %27 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %5, i32 0, i32 1, !dbg !179
  %28 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %27, i32 0, i32 0, !dbg !180
  %29 = load i32, i32* %28, align 1, !dbg !180
  store i32 %29, i32* %8, align 4, !dbg !178
  %30 = load i32, i32* %8, align 4, !dbg !181
  %31 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !183
  %32 = icmp sgt i32 %30, %31, !dbg !184
  br i1 %32, label %33, label %48, !dbg !185

33:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata i32* %9, metadata !186, metadata !DIExpression()), !dbg !188
  store i32 0, i32* %9, align 4, !dbg !188
  %34 = load i32, i32* %8, align 4, !dbg !189
  store i32 %34, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !190
  %35 = call double (...) @get_a(), !dbg !191
  store double %35, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !192
  %36 = load i32, i32* %9, align 4, !dbg !193
  store i32 %36, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !194
  %37 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !195
  %38 = shl i32 %37, 2, !dbg !196
  %39 = load i32, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !197
  %40 = shl i32 %39, 1, !dbg !198
  %41 = or i32 %38, %40, !dbg !199
  %42 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 1, !dbg !200
  %43 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %42, i32 0, i32 0, !dbg !201
  store i32 %41, i32* %43, align 1, !dbg !202
  %44 = load double, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !203
  %45 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !204
  store double %44, double* %45, align 1, !dbg !205
  %46 = load i8*, i8** @_handle_request_get_a.psocket, align 8, !dbg !206
  %47 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !207
  call void @xdc_asyn_send(i8* %46, i8* %47, %struct._tag* %4), !dbg !208
  br label %81, !dbg !209

48:                                               ; preds = %24
  %49 = load i32, i32* %8, align 4, !dbg !210
  %50 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !212
  %51 = icmp eq i32 %49, %50, !dbg !213
  br i1 %51, label %52, label %64, !dbg !214

52:                                               ; preds = %48
  %53 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !215
  %54 = shl i32 %53, 2, !dbg !217
  %55 = load i32, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !218
  %56 = shl i32 %55, 1, !dbg !219
  %57 = or i32 %54, %56, !dbg !220
  %58 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 1, !dbg !221
  %59 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %58, i32 0, i32 0, !dbg !222
  store i32 %57, i32* %59, align 1, !dbg !223
  %60 = load double, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !224
  %61 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !225
  store double %60, double* %61, align 1, !dbg !226
  %62 = load i8*, i8** @_handle_request_get_a.psocket, align 8, !dbg !227
  %63 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !228
  call void @xdc_asyn_send(i8* %62, i8* %63, %struct._tag* %4), !dbg !229
  br label %80, !dbg !230

64:                                               ; preds = %48
  %65 = load i32, i32* %8, align 4, !dbg !231
  %66 = icmp eq i32 %65, -2147483648, !dbg !233
  br i1 %66, label %67, label %79, !dbg !234

67:                                               ; preds = %64
  %68 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !235
  %69 = shl i32 %68, 2, !dbg !237
  %70 = load i32, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !238
  %71 = shl i32 %70, 1, !dbg !239
  %72 = or i32 %69, %71, !dbg !240
  %73 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 1, !dbg !241
  %74 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %73, i32 0, i32 0, !dbg !242
  store i32 %72, i32* %74, align 1, !dbg !243
  %75 = load double, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !244
  %76 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !245
  store double %75, double* %76, align 1, !dbg !246
  %77 = load i8*, i8** @_handle_request_get_a.psocket, align 8, !dbg !247
  %78 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !248
  call void @xdc_asyn_send(i8* %77, i8* %78, %struct._tag* %4), !dbg !249
  br label %79, !dbg !250

79:                                               ; preds = %67, %64
  br label %80

80:                                               ; preds = %79, %52
  br label %81

81:                                               ; preds = %80, %33
  ret void, !dbg !251
}

declare dso_local double @get_a(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_wrapper_nextrpc(i8* %0) #0 !dbg !252 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !255, metadata !DIExpression()), !dbg !256
  br label %3, !dbg !256

3:                                                ; preds = %1, %3
  %4 = load i8*, i8** %2, align 8, !dbg !257
  %5 = bitcast i8* %4 to %struct._tag*, !dbg !257
  call void @_handle_nextrpc(%struct._tag* %5), !dbg !257
  br label %3, !dbg !256, !llvm.loop !259
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_wrapper_request_get_a(i8* %0) #0 !dbg !260 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !261, metadata !DIExpression()), !dbg !262
  br label %3, !dbg !262

3:                                                ; preds = %1, %3
  %4 = load i8*, i8** %2, align 8, !dbg !263
  %5 = bitcast i8* %4 to %struct._tag*, !dbg !263
  call void @_handle_request_get_a(%struct._tag* %5), !dbg !263
  br label %3, !dbg !262, !llvm.loop !265
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_slave_rpc_loop() #0 !dbg !266 {
  %1 = alloca %struct._tag, align 1
  %2 = alloca [2 x i64], align 16
  %3 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct._tag* %1, metadata !269, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata [2 x i64]* %2, metadata !271, metadata !DIExpression()), !dbg !278
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0)), !dbg !279
  %4 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 0, !dbg !280
  %5 = bitcast %struct._tag* %1 to i8*, !dbg !281
  %6 = call i32 @pthread_create(i64* %4, %union.pthread_attr_t* null, i8* (i8*)* @_wrapper_nextrpc, i8* %5) #6, !dbg !282
  %7 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 1, !dbg !283
  %8 = bitcast %struct._tag* %1 to i8*, !dbg !284
  %9 = call i32 @pthread_create(i64* %7, %union.pthread_attr_t* null, i8* (i8*)* @_wrapper_request_get_a, i8* %8) #6, !dbg !285
  call void @llvm.dbg.declare(metadata i32* %3, metadata !286, metadata !DIExpression()), !dbg !288
  store i32 0, i32* %3, align 4, !dbg !288
  br label %10, !dbg !289

10:                                               ; preds = %19, %0
  %11 = load i32, i32* %3, align 4, !dbg !290
  %12 = icmp slt i32 %11, 2, !dbg !292
  br i1 %12, label %13, label %22, !dbg !293

13:                                               ; preds = %10
  %14 = load i32, i32* %3, align 4, !dbg !294
  %15 = sext i32 %14 to i64, !dbg !295
  %16 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 %15, !dbg !295
  %17 = load i64, i64* %16, align 8, !dbg !295
  %18 = call i32 @pthread_join(i64 %17, i8** null), !dbg !296
  br label %19, !dbg !296

19:                                               ; preds = %13
  %20 = load i32, i32* %3, align 4, !dbg !297
  %21 = add nsw i32 %20, 1, !dbg !297
  store i32 %21, i32* %3, align 4, !dbg !297
  br label %10, !dbg !298, !llvm.loop !299

22:                                               ; preds = %10
  ret i32 0, !dbg !301
}

; Function Attrs: nounwind
declare !callback !302 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #5

declare dso_local i32 @pthread_join(i64, i8**) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!46, !47, !48}
!llvm.ident = !{!49}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "inited", scope: !2, file: !3, line: 161, type: !34, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "_handle_nextrpc", scope: !3, file: !3, line: 148, type: !4, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!3 = !DIFile(filename: "./partitioned/multithreaded/orange/orange_rpc.c", directory: "/workspaces/build/apps/examples/example1")
!4 = !DISubroutineType(types: !5)
!5 = !{null, !6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "gaps_tag", file: !8, line: 28, baseType: !9)
!8 = !DIFile(filename: "/opt/closure/include/xdcomms.h", directory: "")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_tag", file: !8, line: 24, size: 96, elements: !10)
!10 = !{!11, !17, !18}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "mux", scope: !9, file: !8, line: 25, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !13, line: 26, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !15, line: 42, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!16 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "sec", scope: !9, file: !8, line: 26, baseType: !12, size: 32, offset: 32)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "typ", scope: !9, file: !8, line: 27, baseType: !12, size: 32, offset: 64)
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !20, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !22, globals: !25, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "partitioned/multithreaded/orange/orange_rpc.c", directory: "/workspaces/build/apps/examples/example1")
!21 = !{}
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!0, !26, !29, !31, !35, !37, !39, !41, !44}
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "psocket", scope: !2, file: !3, line: 162, type: !28, isLocal: true, isDefinition: true)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "ssocket", scope: !2, file: !3, line: 163, type: !28, isLocal: true, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "inited", scope: !33, file: !3, line: 230, type: !34, isLocal: true, isDefinition: true)
!33 = distinct !DISubprogram(name: "_handle_request_get_a", scope: !3, file: !3, line: 214, type: !4, scopeLine: 214, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "psocket", scope: !33, file: !3, line: 231, type: !28, isLocal: true, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "ssocket", scope: !33, file: !3, line: 232, type: !28, isLocal: true, isDefinition: true)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "processed_counter", scope: !33, file: !3, line: 233, type: !34, isLocal: true, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "last_processed_result", scope: !33, file: !3, line: 234, type: !43, isLocal: true, isDefinition: true)
!43 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "last_processed_error", scope: !33, file: !3, line: 235, type: !34, isLocal: true, isDefinition: true)
!46 = !{i32 7, !"Dwarf Version", i32 4}
!47 = !{i32 2, !"Debug Info Version", i32 3}
!48 = !{i32 1, !"wchar_size", i32 4}
!49 = !{!"clang version 10.0.0-4ubuntu1 "}
!50 = distinct !DISubprogram(name: "_hal_init", scope: !3, file: !3, line: 137, type: !51, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!51 = !DISubroutineType(types: !52)
!52 = !{null, !23, !23}
!53 = !DILocalVariable(name: "inuri", arg: 1, scope: !50, file: !3, line: 137, type: !23)
!54 = !DILocation(line: 137, column: 22, scope: !50)
!55 = !DILocalVariable(name: "outuri", arg: 2, scope: !50, file: !3, line: 137, type: !23)
!56 = !DILocation(line: 137, column: 35, scope: !50)
!57 = !DILocation(line: 139, column: 16, scope: !50)
!58 = !DILocation(line: 139, column: 5, scope: !50)
!59 = !DILocation(line: 140, column: 17, scope: !50)
!60 = !DILocation(line: 140, column: 5, scope: !50)
!61 = !DILocation(line: 141, column: 5, scope: !50)
!62 = !DILocation(line: 142, column: 5, scope: !50)
!63 = !DILocation(line: 143, column: 5, scope: !50)
!64 = !DILocation(line: 144, column: 5, scope: !50)
!65 = !DILocation(line: 146, column: 1, scope: !50)
!66 = !DILocalVariable(name: "n_tag", arg: 1, scope: !2, file: !3, line: 148, type: !6)
!67 = !DILocation(line: 148, column: 32, scope: !2)
!68 = !DILocalVariable(name: "t_tag", scope: !2, file: !3, line: 164, type: !7)
!69 = !DILocation(line: 164, column: 14, scope: !2)
!70 = !DILocalVariable(name: "o_tag", scope: !2, file: !3, line: 165, type: !7)
!71 = !DILocation(line: 165, column: 14, scope: !2)
!72 = !DILocalVariable(name: "nxt", scope: !2, file: !3, line: 169, type: !73)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "nextrpc_datatype", file: !74, line: 39, baseType: !75)
!74 = !DIFile(filename: "./partitioned/multithreaded/autogen/codec.h", directory: "/workspaces/build/apps/examples/example1")
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_nextrpc_datatype", file: !74, line: 34, size: 224, elements: !76)
!76 = !{!77, !81, !82, !83}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "mux", scope: !75, file: !74, line: 35, baseType: !78, size: 32)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !79, line: 26, baseType: !80)
!79 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !15, line: 41, baseType: !34)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "sec", scope: !75, file: !74, line: 36, baseType: !78, size: 32, offset: 32)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "typ", scope: !75, file: !74, line: 37, baseType: !78, size: 32, offset: 64)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !75, file: !74, line: 38, baseType: !84, size: 128, offset: 96)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "trailer_datatype", file: !74, line: 24, baseType: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_trailer_datatype", file: !74, line: 18, size: 128, elements: !86)
!86 = !{!87, !88, !89, !90, !94}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !85, file: !74, line: 19, baseType: !12, size: 32)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "rqr", scope: !85, file: !74, line: 20, baseType: !12, size: 32, offset: 32)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "oid", scope: !85, file: !74, line: 21, baseType: !12, size: 32, offset: 64)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "mid", scope: !85, file: !74, line: 22, baseType: !91, size: 16, offset: 96)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !13, line: 25, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !15, line: 40, baseType: !93)
!93 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "crc", scope: !85, file: !74, line: 23, baseType: !91, size: 16, offset: 112)
!95 = !DILocation(line: 169, column: 22, scope: !2)
!96 = !DILocation(line: 169, column: 5, scope: !2)
!97 = !DILocalVariable(name: "okay", scope: !2, file: !3, line: 174, type: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "okay_datatype", file: !74, line: 51, baseType: !99)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_okay_datatype", file: !74, line: 48, size: 160, elements: !100)
!100 = !{!101, !102}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !99, file: !74, line: 49, baseType: !78, size: 32)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !99, file: !74, line: 50, baseType: !84, size: 128, offset: 32)
!103 = !DILocation(line: 174, column: 19, scope: !2)
!104 = !DILocation(line: 174, column: 5, scope: !2)
!105 = !DILocation(line: 180, column: 5, scope: !2)
!106 = !DILocation(line: 188, column: 10, scope: !107)
!107 = distinct !DILexicalBlock(scope: !2, file: !3, line: 188, column: 9)
!108 = !DILocation(line: 188, column: 9, scope: !2)
!109 = !DILocation(line: 189, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !3, line: 188, column: 18)
!111 = !DILocation(line: 190, column: 19, scope: !110)
!112 = !DILocation(line: 190, column: 17, scope: !110)
!113 = !DILocation(line: 191, column: 19, scope: !110)
!114 = !DILocation(line: 191, column: 17, scope: !110)
!115 = !DILocation(line: 192, column: 9, scope: !110)
!116 = !DILocation(line: 193, column: 5, scope: !110)
!117 = !DILocation(line: 204, column: 23, scope: !2)
!118 = !DILocation(line: 204, column: 32, scope: !2)
!119 = !DILocation(line: 204, column: 5, scope: !2)
!120 = !DILocation(line: 205, column: 5, scope: !2)
!121 = !DILocation(line: 206, column: 10, scope: !2)
!122 = !DILocation(line: 206, column: 12, scope: !2)
!123 = !DILocation(line: 207, column: 19, scope: !2)
!124 = !DILocation(line: 207, column: 28, scope: !2)
!125 = !DILocation(line: 207, column: 5, scope: !2)
!126 = !DILocation(line: 209, column: 22, scope: !2)
!127 = !DILocation(line: 209, column: 5, scope: !2)
!128 = !DILocation(line: 209, column: 12, scope: !2)
!129 = !DILocation(line: 209, column: 16, scope: !2)
!130 = !DILocation(line: 210, column: 22, scope: !2)
!131 = !DILocation(line: 210, column: 5, scope: !2)
!132 = !DILocation(line: 210, column: 12, scope: !2)
!133 = !DILocation(line: 210, column: 16, scope: !2)
!134 = !DILocation(line: 211, column: 22, scope: !2)
!135 = !DILocation(line: 211, column: 5, scope: !2)
!136 = !DILocation(line: 211, column: 12, scope: !2)
!137 = !DILocation(line: 211, column: 16, scope: !2)
!138 = !DILocation(line: 212, column: 1, scope: !2)
!139 = !DILocalVariable(name: "tag", arg: 1, scope: !33, file: !3, line: 214, type: !6)
!140 = !DILocation(line: 214, column: 38, scope: !33)
!141 = !DILocalVariable(name: "t_tag", scope: !33, file: !3, line: 236, type: !7)
!142 = !DILocation(line: 236, column: 14, scope: !33)
!143 = !DILocalVariable(name: "o_tag", scope: !33, file: !3, line: 237, type: !7)
!144 = !DILocation(line: 237, column: 14, scope: !33)
!145 = !DILocalVariable(name: "req_get_a", scope: !33, file: !3, line: 241, type: !146)
!146 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_a_datatype", file: !74, line: 61, baseType: !147)
!147 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_a_datatype", file: !74, line: 58, size: 160, elements: !148)
!148 = !{!149, !150}
!149 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !147, file: !74, line: 59, baseType: !78, size: 32)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !147, file: !74, line: 60, baseType: !84, size: 128, offset: 32)
!151 = !DILocation(line: 241, column: 28, scope: !33)
!152 = !DILocation(line: 241, column: 5, scope: !33)
!153 = !DILocation(line: 247, column: 5, scope: !33)
!154 = !DILocalVariable(name: "res_get_a", scope: !33, file: !3, line: 251, type: !155)
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_a_datatype", file: !74, line: 71, baseType: !156)
!156 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_a_datatype", file: !74, line: 68, size: 192, elements: !157)
!157 = !{!158, !159}
!158 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !156, file: !74, line: 69, baseType: !43, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !156, file: !74, line: 70, baseType: !84, size: 128, offset: 64)
!160 = !DILocation(line: 251, column: 29, scope: !33)
!161 = !DILocation(line: 251, column: 5, scope: !33)
!162 = !DILocation(line: 257, column: 5, scope: !33)
!163 = !DILocation(line: 265, column: 10, scope: !164)
!164 = distinct !DILexicalBlock(scope: !33, file: !3, line: 265, column: 9)
!165 = !DILocation(line: 265, column: 9, scope: !33)
!166 = !DILocation(line: 266, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !3, line: 265, column: 18)
!168 = !DILocation(line: 267, column: 19, scope: !167)
!169 = !DILocation(line: 267, column: 17, scope: !167)
!170 = !DILocation(line: 268, column: 19, scope: !167)
!171 = !DILocation(line: 268, column: 17, scope: !167)
!172 = !DILocation(line: 269, column: 9, scope: !167)
!173 = !DILocation(line: 270, column: 5, scope: !167)
!174 = !DILocation(line: 275, column: 23, scope: !33)
!175 = !DILocation(line: 275, column: 32, scope: !33)
!176 = !DILocation(line: 275, column: 5, scope: !33)
!177 = !DILocalVariable(name: "reqId", scope: !33, file: !3, line: 307, type: !34)
!178 = !DILocation(line: 307, column: 9, scope: !33)
!179 = !DILocation(line: 307, column: 27, scope: !33)
!180 = !DILocation(line: 307, column: 35, scope: !33)
!181 = !DILocation(line: 308, column: 8, scope: !182)
!182 = distinct !DILexicalBlock(scope: !33, file: !3, line: 308, column: 8)
!183 = !DILocation(line: 308, column: 16, scope: !182)
!184 = !DILocation(line: 308, column: 14, scope: !182)
!185 = !DILocation(line: 308, column: 8, scope: !33)
!186 = !DILocalVariable(name: "error", scope: !187, file: !3, line: 309, type: !34)
!187 = distinct !DILexicalBlock(scope: !182, file: !3, line: 308, column: 34)
!188 = !DILocation(line: 309, column: 13, scope: !187)
!189 = !DILocation(line: 310, column: 29, scope: !187)
!190 = !DILocation(line: 310, column: 27, scope: !187)
!191 = !DILocation(line: 311, column: 33, scope: !187)
!192 = !DILocation(line: 311, column: 31, scope: !187)
!193 = !DILocation(line: 312, column: 32, scope: !187)
!194 = !DILocation(line: 312, column: 30, scope: !187)
!195 = !DILocation(line: 313, column: 33, scope: !187)
!196 = !DILocation(line: 313, column: 51, scope: !187)
!197 = !DILocation(line: 313, column: 58, scope: !187)
!198 = !DILocation(line: 313, column: 79, scope: !187)
!199 = !DILocation(line: 313, column: 56, scope: !187)
!200 = !DILocation(line: 313, column: 19, scope: !187)
!201 = !DILocation(line: 313, column: 27, scope: !187)
!202 = !DILocation(line: 313, column: 31, scope: !187)
!203 = !DILocation(line: 314, column: 25, scope: !187)
!204 = !DILocation(line: 314, column: 19, scope: !187)
!205 = !DILocation(line: 314, column: 23, scope: !187)
!206 = !DILocation(line: 316, column: 23, scope: !187)
!207 = !DILocation(line: 316, column: 32, scope: !187)
!208 = !DILocation(line: 316, column: 9, scope: !187)
!209 = !DILocation(line: 318, column: 5, scope: !187)
!210 = !DILocation(line: 319, column: 13, scope: !211)
!211 = distinct !DILexicalBlock(scope: !182, file: !3, line: 319, column: 13)
!212 = !DILocation(line: 319, column: 22, scope: !211)
!213 = !DILocation(line: 319, column: 19, scope: !211)
!214 = !DILocation(line: 319, column: 13, scope: !182)
!215 = !DILocation(line: 319, column: 73, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !3, line: 319, column: 40)
!217 = !DILocation(line: 319, column: 91, scope: !216)
!218 = !DILocation(line: 319, column: 98, scope: !216)
!219 = !DILocation(line: 319, column: 119, scope: !216)
!220 = !DILocation(line: 319, column: 96, scope: !216)
!221 = !DILocation(line: 319, column: 59, scope: !216)
!222 = !DILocation(line: 319, column: 67, scope: !216)
!223 = !DILocation(line: 319, column: 71, scope: !216)
!224 = !DILocation(line: 320, column: 25, scope: !216)
!225 = !DILocation(line: 320, column: 19, scope: !216)
!226 = !DILocation(line: 320, column: 23, scope: !216)
!227 = !DILocation(line: 322, column: 23, scope: !216)
!228 = !DILocation(line: 322, column: 32, scope: !216)
!229 = !DILocation(line: 322, column: 9, scope: !216)
!230 = !DILocation(line: 324, column: 5, scope: !216)
!231 = !DILocation(line: 325, column: 13, scope: !232)
!232 = distinct !DILexicalBlock(scope: !211, file: !3, line: 325, column: 13)
!233 = !DILocation(line: 325, column: 19, scope: !232)
!234 = !DILocation(line: 325, column: 13, scope: !211)
!235 = !DILocation(line: 326, column: 33, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !3, line: 325, column: 30)
!237 = !DILocation(line: 326, column: 51, scope: !236)
!238 = !DILocation(line: 326, column: 58, scope: !236)
!239 = !DILocation(line: 326, column: 79, scope: !236)
!240 = !DILocation(line: 326, column: 56, scope: !236)
!241 = !DILocation(line: 326, column: 19, scope: !236)
!242 = !DILocation(line: 326, column: 27, scope: !236)
!243 = !DILocation(line: 326, column: 31, scope: !236)
!244 = !DILocation(line: 327, column: 25, scope: !236)
!245 = !DILocation(line: 327, column: 19, scope: !236)
!246 = !DILocation(line: 327, column: 23, scope: !236)
!247 = !DILocation(line: 329, column: 23, scope: !236)
!248 = !DILocation(line: 329, column: 32, scope: !236)
!249 = !DILocation(line: 329, column: 9, scope: !236)
!250 = !DILocation(line: 331, column: 5, scope: !236)
!251 = !DILocation(line: 333, column: 1, scope: !33)
!252 = distinct !DISubprogram(name: "_wrapper_nextrpc", scope: !3, file: !3, line: 336, type: !253, scopeLine: 336, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!253 = !DISubroutineType(types: !254)
!254 = !{!28, !28}
!255 = !DILocalVariable(name: "tag", arg: 1, scope: !252, file: !3, line: 336, type: !28)
!256 = !DILocation(line: 336, column: 1, scope: !252)
!257 = !DILocation(line: 336, column: 1, scope: !258)
!258 = distinct !DILexicalBlock(scope: !252, file: !3, line: 336, column: 1)
!259 = distinct !{!259, !256, !256}
!260 = distinct !DISubprogram(name: "_wrapper_request_get_a", scope: !3, file: !3, line: 337, type: !253, scopeLine: 337, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!261 = !DILocalVariable(name: "tag", arg: 1, scope: !260, file: !3, line: 337, type: !28)
!262 = !DILocation(line: 337, column: 1, scope: !260)
!263 = !DILocation(line: 337, column: 1, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !3, line: 337, column: 1)
!265 = distinct !{!265, !262, !262}
!266 = distinct !DISubprogram(name: "_slave_rpc_loop", scope: !3, file: !3, line: 339, type: !267, scopeLine: 339, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!267 = !DISubroutineType(types: !268)
!268 = !{!34}
!269 = !DILocalVariable(name: "n_tag", scope: !266, file: !3, line: 340, type: !7)
!270 = !DILocation(line: 340, column: 14, scope: !266)
!271 = !DILocalVariable(name: "tid", scope: !266, file: !3, line: 341, type: !272)
!272 = !DICompositeType(tag: DW_TAG_array_type, baseType: !273, size: 128, elements: !276)
!273 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !274, line: 27, baseType: !275)
!274 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "")
!275 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!276 = !{!277}
!277 = !DISubrange(count: 2)
!278 = !DILocation(line: 341, column: 15, scope: !266)
!279 = !DILocation(line: 342, column: 5, scope: !266)
!280 = !DILocation(line: 343, column: 21, scope: !266)
!281 = !DILocation(line: 343, column: 53, scope: !266)
!282 = !DILocation(line: 343, column: 5, scope: !266)
!283 = !DILocation(line: 344, column: 21, scope: !266)
!284 = !DILocation(line: 344, column: 59, scope: !266)
!285 = !DILocation(line: 344, column: 5, scope: !266)
!286 = !DILocalVariable(name: "i", scope: !287, file: !3, line: 345, type: !34)
!287 = distinct !DILexicalBlock(scope: !266, file: !3, line: 345, column: 5)
!288 = !DILocation(line: 345, column: 14, scope: !287)
!289 = !DILocation(line: 345, column: 10, scope: !287)
!290 = !DILocation(line: 345, column: 21, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !3, line: 345, column: 5)
!292 = !DILocation(line: 345, column: 23, scope: !291)
!293 = !DILocation(line: 345, column: 5, scope: !287)
!294 = !DILocation(line: 345, column: 55, scope: !291)
!295 = !DILocation(line: 345, column: 51, scope: !291)
!296 = !DILocation(line: 345, column: 38, scope: !291)
!297 = !DILocation(line: 345, column: 34, scope: !291)
!298 = !DILocation(line: 345, column: 5, scope: !291)
!299 = distinct !{!299, !293, !300}
!300 = !DILocation(line: 345, column: 63, scope: !287)
!301 = !DILocation(line: 346, column: 5, scope: !266)
!302 = !{!303}
!303 = !{i64 2, i64 3, i1 false}
