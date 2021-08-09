; ModuleID = './partitioned/multithreaded/orange/orange_rpc.c'
source_filename = "./partitioned/multithreaded/orange/orange_rpc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
@_handle_request_get_a.restart_state = internal global i32 -1, align 4, !dbg !41
@_handle_request_get_a.last_processed_result = internal global double 0.000000e+00, align 8, !dbg !43
@_handle_request_get_a.last_processed_error = internal global i32 0, align 4, !dbg !46
@_handle_request_get_a.callee_restarted = internal global i32 0, align 4, !dbg !48
@.str.3 = private unnamed_addr constant [18 x i8] c"TAG_REQUEST_GET_A\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [19 x i8] c"TAG_RESPONSE_GET_A\00", section "llvm.metadata"
@caller_restarted_get_a = common dso_local global i8 0, align 1, !dbg !50
@.str.5 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_suborange\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_puborange\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_hal_init(i8* %0, i8* %1) #0 !dbg !58 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !61, metadata !DIExpression()), !dbg !62
  store i8* %1, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !63, metadata !DIExpression()), !dbg !64
  %5 = load i8*, i8** %3, align 8, !dbg !65
  %6 = call i8* @xdc_set_in(i8* %5), !dbg !66
  %7 = load i8*, i8** %4, align 8, !dbg !67
  %8 = call i8* @xdc_set_out(i8* %7), !dbg !68
  call void @xdc_register(void (i8*, i8*, i64*)* @nextrpc_data_encode, void (i8*, i8*, i64*)* @nextrpc_data_decode, i32 1), !dbg !69
  call void @xdc_register(void (i8*, i8*, i64*)* @okay_data_encode, void (i8*, i8*, i64*)* @okay_data_decode, i32 2), !dbg !70
  call void @xdc_register(void (i8*, i8*, i64*)* @request_get_a_data_encode, void (i8*, i8*, i64*)* @request_get_a_data_decode, i32 3), !dbg !71
  call void @xdc_register(void (i8*, i8*, i64*)* @response_get_a_data_encode, void (i8*, i8*, i64*)* @response_get_a_data_decode, i32 4), !dbg !72
  ret void, !dbg !73
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
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata %struct._nextrpc_datatype* %5, metadata !80, metadata !DIExpression()), !dbg !103
  %8 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !104
  call void @llvm.var.annotation(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 138), !dbg !104
  call void @llvm.dbg.declare(metadata %struct._okay_datatype* %6, metadata !105, metadata !DIExpression()), !dbg !111
  %9 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !112
  call void @llvm.var.annotation(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 143), !dbg !112
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 1), !dbg !113
  %10 = load i32, i32* @_handle_nextrpc.inited, align 4, !dbg !114
  %11 = icmp ne i32 %10, 0, !dbg !114
  br i1 %11, label %22, label %12, !dbg !116

12:                                               ; preds = %1
  store i32 1, i32* @_handle_nextrpc.inited, align 4, !dbg !117
  %13 = call i8* @xdc_pub_socket(), !dbg !119
  store i8* %13, i8** @_handle_nextrpc.psocket, align 8, !dbg !120
  %14 = bitcast { i64, i32 }* %7 to i8*, !dbg !121
  %15 = bitcast %struct._tag* %3 to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %14, i8* align 1 %15, i64 12, i1 false), !dbg !121
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !121
  %17 = load i64, i64* %16, align 1, !dbg !121
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !121
  %19 = load i32, i32* %18, align 1, !dbg !121
  %20 = call i8* @xdc_sub_socket(i64 %17, i32 %19), !dbg !121
  store i8* %20, i8** @_handle_nextrpc.ssocket, align 8, !dbg !122
  %21 = call i32 @sleep(i32 1), !dbg !123
  br label %22, !dbg !124

22:                                               ; preds = %12, %1
  %23 = load i8*, i8** @_handle_nextrpc.ssocket, align 8, !dbg !125
  %24 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !126
  call void @xdc_blocking_recv(i8* %23, i8* %24, %struct._tag* %3), !dbg !127
  call void @tag_write(%struct._tag* %4, i32 1, i32 1, i32 2), !dbg !128
  %25 = getelementptr inbounds %struct._okay_datatype, %struct._okay_datatype* %6, i32 0, i32 0, !dbg !129
  store i32 0, i32* %25, align 1, !dbg !130
  %26 = load i8*, i8** @_handle_nextrpc.psocket, align 8, !dbg !131
  %27 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !132
  call void @xdc_asyn_send(i8* %26, i8* %27, %struct._tag* %4), !dbg !133
  %28 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 0, !dbg !134
  %29 = load i32, i32* %28, align 1, !dbg !134
  %30 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !135
  %31 = getelementptr inbounds %struct._tag, %struct._tag* %30, i32 0, i32 0, !dbg !136
  store i32 %29, i32* %31, align 1, !dbg !137
  %32 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 1, !dbg !138
  %33 = load i32, i32* %32, align 1, !dbg !138
  %34 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !139
  %35 = getelementptr inbounds %struct._tag, %struct._tag* %34, i32 0, i32 1, !dbg !140
  store i32 %33, i32* %35, align 1, !dbg !141
  %36 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 2, !dbg !142
  %37 = load i32, i32* %36, align 1, !dbg !142
  %38 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !143
  %39 = getelementptr inbounds %struct._tag, %struct._tag* %38, i32 0, i32 2, !dbg !144
  store i32 %37, i32* %39, align 1, !dbg !145
  ret void, !dbg !146
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
  %9 = alloca i8, align 1
  store %struct._tag* %0, %struct._tag** %2, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %5, metadata !153, metadata !DIExpression()), !dbg !159
  %10 = bitcast %struct._request_get_a_datatype* %5 to i8*, !dbg !160
  call void @llvm.var.annotation(i8* %10, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 209), !dbg !160
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 3), !dbg !161
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %6, metadata !162, metadata !DIExpression()), !dbg !168
  %11 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !169
  call void @llvm.var.annotation(i8* %11, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 219), !dbg !169
  call void @tag_write(%struct._tag* %4, i32 1, i32 1, i32 4), !dbg !170
  %12 = load i32, i32* @_handle_request_get_a.inited, align 4, !dbg !171
  %13 = icmp ne i32 %12, 0, !dbg !171
  br i1 %13, label %24, label %14, !dbg !173

14:                                               ; preds = %1
  store i32 1, i32* @_handle_request_get_a.inited, align 4, !dbg !174
  store i32 1, i32* @_handle_request_get_a.callee_restarted, align 4, !dbg !176
  %15 = call i8* @xdc_pub_socket(), !dbg !177
  store i8* %15, i8** @_handle_request_get_a.psocket, align 8, !dbg !178
  %16 = bitcast { i64, i32 }* %7 to i8*, !dbg !179
  %17 = bitcast %struct._tag* %3 to i8*, !dbg !179
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %16, i8* align 1 %17, i64 12, i1 false), !dbg !179
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !179
  %19 = load i64, i64* %18, align 1, !dbg !179
  %20 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !179
  %21 = load i32, i32* %20, align 1, !dbg !179
  %22 = call i8* @xdc_sub_socket(i64 %19, i32 %21), !dbg !179
  store i8* %22, i8** @_handle_request_get_a.ssocket, align 8, !dbg !180
  %23 = call i32 @sleep(i32 1), !dbg !181
  br label %24, !dbg !182

24:                                               ; preds = %14, %1
  %25 = load i8*, i8** @_handle_request_get_a.ssocket, align 8, !dbg !183
  %26 = bitcast %struct._request_get_a_datatype* %5 to i8*, !dbg !184
  call void @xdc_blocking_recv(i8* %25, i8* %26, %struct._tag* %3), !dbg !185
  %27 = call double (...) @get_a(), !dbg !186
  %28 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !187
  store double %27, double* %28, align 1, !dbg !188
  call void @llvm.dbg.declare(metadata i32* %8, metadata !189, metadata !DIExpression()), !dbg !190
  %29 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %5, i32 0, i32 1, !dbg !191
  %30 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %29, i32 0, i32 0, !dbg !192
  %31 = load i32, i32* %30, align 1, !dbg !192
  store i32 %31, i32* %8, align 4, !dbg !190
  %32 = load i32, i32* %8, align 4, !dbg !193
  %33 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !195
  %34 = icmp sgt i32 %32, %33, !dbg !196
  br i1 %34, label %35, label %59, !dbg !197

35:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata i8* %9, metadata !198, metadata !DIExpression()), !dbg !200
  store i8 0, i8* %9, align 1, !dbg !200
  %36 = load i32, i32* %8, align 4, !dbg !201
  store i32 %36, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !202
  %37 = load i32, i32* %8, align 4, !dbg !203
  %38 = load i32, i32* @_handle_request_get_a.restart_state, align 4, !dbg !205
  %39 = icmp eq i32 %37, %38, !dbg !206
  br i1 %39, label %40, label %41, !dbg !207

40:                                               ; preds = %35
  store i8 1, i8* @caller_restarted_get_a, align 1, !dbg !208
  br label %41, !dbg !209

41:                                               ; preds = %40, %35
  %42 = call double (...) @get_a(), !dbg !210
  store double %42, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !211
  %43 = load i8, i8* %9, align 1, !dbg !212
  %44 = trunc i8 %43 to i1, !dbg !212
  %45 = zext i1 %44 to i32, !dbg !212
  store i32 %45, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !213
  store i32 -1, i32* @_handle_request_get_a.restart_state, align 4, !dbg !214
  store i8 0, i8* @caller_restarted_get_a, align 1, !dbg !215
  %46 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !216
  %47 = shl i32 %46, 2, !dbg !217
  %48 = load i32, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !218
  %49 = shl i32 %48, 1, !dbg !219
  %50 = or i32 %47, %49, !dbg !220
  %51 = load i32, i32* @_handle_request_get_a.callee_restarted, align 4, !dbg !221
  %52 = or i32 %50, %51, !dbg !222
  %53 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 1, !dbg !223
  %54 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %53, i32 0, i32 0, !dbg !224
  store i32 %52, i32* %54, align 1, !dbg !225
  %55 = load double, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !226
  %56 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !227
  store double %55, double* %56, align 1, !dbg !228
  %57 = load i8*, i8** @_handle_request_get_a.psocket, align 8, !dbg !229
  %58 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !230
  call void @xdc_asyn_send(i8* %57, i8* %58, %struct._tag* %4), !dbg !231
  br label %98, !dbg !232

59:                                               ; preds = %24
  %60 = load i32, i32* %8, align 4, !dbg !233
  %61 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !235
  %62 = icmp eq i32 %60, %61, !dbg !236
  br i1 %62, label %63, label %77, !dbg !237

63:                                               ; preds = %59
  %64 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !238
  %65 = shl i32 %64, 2, !dbg !240
  %66 = load i32, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !241
  %67 = shl i32 %66, 1, !dbg !242
  %68 = or i32 %65, %67, !dbg !243
  %69 = load i32, i32* @_handle_request_get_a.callee_restarted, align 4, !dbg !244
  %70 = or i32 %68, %69, !dbg !245
  %71 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 1, !dbg !246
  %72 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %71, i32 0, i32 0, !dbg !247
  store i32 %70, i32* %72, align 1, !dbg !248
  %73 = load double, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !249
  %74 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !250
  store double %73, double* %74, align 1, !dbg !251
  %75 = load i8*, i8** @_handle_request_get_a.psocket, align 8, !dbg !252
  %76 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !253
  call void @xdc_asyn_send(i8* %75, i8* %76, %struct._tag* %4), !dbg !254
  br label %97, !dbg !255

77:                                               ; preds = %59
  %78 = load i32, i32* %8, align 4, !dbg !256
  %79 = icmp eq i32 %78, -2147483648, !dbg !258
  br i1 %79, label %80, label %96, !dbg !259

80:                                               ; preds = %77
  %81 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !260
  %82 = shl i32 %81, 2, !dbg !262
  %83 = load i32, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !263
  %84 = shl i32 %83, 1, !dbg !264
  %85 = or i32 %82, %84, !dbg !265
  %86 = load i32, i32* @_handle_request_get_a.callee_restarted, align 4, !dbg !266
  %87 = or i32 %85, %86, !dbg !267
  %88 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 1, !dbg !268
  %89 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %88, i32 0, i32 0, !dbg !269
  store i32 %87, i32* %89, align 1, !dbg !270
  %90 = load double, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !271
  %91 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !272
  store double %90, double* %91, align 1, !dbg !273
  %92 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !274
  %93 = add nsw i32 %92, 1, !dbg !275
  store i32 %93, i32* @_handle_request_get_a.restart_state, align 4, !dbg !276
  %94 = load i8*, i8** @_handle_request_get_a.psocket, align 8, !dbg !277
  %95 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !278
  call void @xdc_asyn_send(i8* %94, i8* %95, %struct._tag* %4), !dbg !279
  br label %96, !dbg !280

96:                                               ; preds = %80, %77
  br label %97

97:                                               ; preds = %96, %63
  br label %98

98:                                               ; preds = %97, %41
  store i32 0, i32* @_handle_request_get_a.callee_restarted, align 4, !dbg !281
  ret void, !dbg !282
}

declare dso_local double @get_a(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_wrapper_nextrpc(i8* %0) #0 !dbg !283 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !286, metadata !DIExpression()), !dbg !287
  br label %3, !dbg !287

3:                                                ; preds = %1, %3
  %4 = load i8*, i8** %2, align 8, !dbg !288
  %5 = bitcast i8* %4 to %struct._tag*, !dbg !288
  call void @_handle_nextrpc(%struct._tag* %5), !dbg !288
  br label %3, !dbg !287, !llvm.loop !290
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_wrapper_request_get_a(i8* %0) #0 !dbg !291 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !292, metadata !DIExpression()), !dbg !293
  br label %3, !dbg !293

3:                                                ; preds = %1, %3
  %4 = load i8*, i8** %2, align 8, !dbg !294
  %5 = bitcast i8* %4 to %struct._tag*, !dbg !294
  call void @_handle_request_get_a(%struct._tag* %5), !dbg !294
  br label %3, !dbg !293, !llvm.loop !296
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_slave_rpc_loop() #0 !dbg !297 {
  %1 = alloca %struct._tag, align 1
  %2 = alloca [2 x i64], align 16
  %3 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct._tag* %1, metadata !300, metadata !DIExpression()), !dbg !301
  call void @llvm.dbg.declare(metadata [2 x i64]* %2, metadata !302, metadata !DIExpression()), !dbg !309
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0)), !dbg !310
  %4 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 0, !dbg !311
  %5 = bitcast %struct._tag* %1 to i8*, !dbg !312
  %6 = call i32 @pthread_create(i64* %4, %union.pthread_attr_t* null, i8* (i8*)* @_wrapper_nextrpc, i8* %5) #6, !dbg !313
  %7 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 1, !dbg !314
  %8 = bitcast %struct._tag* %1 to i8*, !dbg !315
  %9 = call i32 @pthread_create(i64* %7, %union.pthread_attr_t* null, i8* (i8*)* @_wrapper_request_get_a, i8* %8) #6, !dbg !316
  call void @llvm.dbg.declare(metadata i32* %3, metadata !317, metadata !DIExpression()), !dbg !319
  store i32 0, i32* %3, align 4, !dbg !319
  br label %10, !dbg !320

10:                                               ; preds = %19, %0
  %11 = load i32, i32* %3, align 4, !dbg !321
  %12 = icmp slt i32 %11, 2, !dbg !323
  br i1 %12, label %13, label %22, !dbg !324

13:                                               ; preds = %10
  %14 = load i32, i32* %3, align 4, !dbg !325
  %15 = sext i32 %14 to i64, !dbg !326
  %16 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 %15, !dbg !326
  %17 = load i64, i64* %16, align 8, !dbg !326
  %18 = call i32 @pthread_join(i64 %17, i8** null), !dbg !327
  br label %19, !dbg !327

19:                                               ; preds = %13
  %20 = load i32, i32* %3, align 4, !dbg !328
  %21 = add nsw i32 %20, 1, !dbg !328
  store i32 %21, i32* %3, align 4, !dbg !328
  br label %10, !dbg !329, !llvm.loop !330

22:                                               ; preds = %10
  ret i32 0, !dbg !332
}

; Function Attrs: nounwind
declare !callback !333 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #5

declare dso_local i32 @pthread_join(i64, i8**) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!54, !55, !56}
!llvm.ident = !{!57}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "inited", scope: !2, file: !3, line: 130, type: !34, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "_handle_nextrpc", scope: !3, file: !3, line: 117, type: !4, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
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
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !20, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !22, globals: !25, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "partitioned/multithreaded/orange/orange_rpc.c", directory: "/workspaces/build/apps/examples/example1")
!21 = !{}
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!0, !26, !29, !31, !35, !37, !39, !41, !43, !46, !48, !50}
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "psocket", scope: !2, file: !3, line: 131, type: !28, isLocal: true, isDefinition: true)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "ssocket", scope: !2, file: !3, line: 132, type: !28, isLocal: true, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "inited", scope: !33, file: !3, line: 196, type: !34, isLocal: true, isDefinition: true)
!33 = distinct !DISubprogram(name: "_handle_request_get_a", scope: !3, file: !3, line: 183, type: !4, scopeLine: 183, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "psocket", scope: !33, file: !3, line: 197, type: !28, isLocal: true, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "ssocket", scope: !33, file: !3, line: 198, type: !28, isLocal: true, isDefinition: true)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "processed_counter", scope: !33, file: !3, line: 199, type: !34, isLocal: true, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "restart_state", scope: !33, file: !3, line: 200, type: !34, isLocal: true, isDefinition: true)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(name: "last_processed_result", scope: !33, file: !3, line: 201, type: !45, isLocal: true, isDefinition: true)
!45 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "last_processed_error", scope: !33, file: !3, line: 202, type: !34, isLocal: true, isDefinition: true)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(name: "callee_restarted", scope: !33, file: !3, line: 203, type: !34, isLocal: true, isDefinition: true)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "caller_restarted_get_a", scope: !19, file: !52, line: 55, type: !53, isLocal: false, isDefinition: true)
!52 = !DIFile(filename: "./partitioned/multithreaded/orange/orange_rpc.h", directory: "/workspaces/build/apps/examples/example1")
!53 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!54 = !{i32 7, !"Dwarf Version", i32 4}
!55 = !{i32 2, !"Debug Info Version", i32 3}
!56 = !{i32 1, !"wchar_size", i32 4}
!57 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!58 = distinct !DISubprogram(name: "_hal_init", scope: !3, file: !3, line: 106, type: !59, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!59 = !DISubroutineType(types: !60)
!60 = !{null, !23, !23}
!61 = !DILocalVariable(name: "inuri", arg: 1, scope: !58, file: !3, line: 106, type: !23)
!62 = !DILocation(line: 106, column: 22, scope: !58)
!63 = !DILocalVariable(name: "outuri", arg: 2, scope: !58, file: !3, line: 106, type: !23)
!64 = !DILocation(line: 106, column: 35, scope: !58)
!65 = !DILocation(line: 108, column: 16, scope: !58)
!66 = !DILocation(line: 108, column: 5, scope: !58)
!67 = !DILocation(line: 109, column: 17, scope: !58)
!68 = !DILocation(line: 109, column: 5, scope: !58)
!69 = !DILocation(line: 110, column: 5, scope: !58)
!70 = !DILocation(line: 111, column: 5, scope: !58)
!71 = !DILocation(line: 112, column: 5, scope: !58)
!72 = !DILocation(line: 113, column: 5, scope: !58)
!73 = !DILocation(line: 115, column: 1, scope: !58)
!74 = !DILocalVariable(name: "n_tag", arg: 1, scope: !2, file: !3, line: 117, type: !6)
!75 = !DILocation(line: 117, column: 32, scope: !2)
!76 = !DILocalVariable(name: "t_tag", scope: !2, file: !3, line: 133, type: !7)
!77 = !DILocation(line: 133, column: 14, scope: !2)
!78 = !DILocalVariable(name: "o_tag", scope: !2, file: !3, line: 134, type: !7)
!79 = !DILocation(line: 134, column: 14, scope: !2)
!80 = !DILocalVariable(name: "nxt", scope: !2, file: !3, line: 138, type: !81)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "nextrpc_datatype", file: !82, line: 39, baseType: !83)
!82 = !DIFile(filename: "./partitioned/multithreaded/autogen/codec.h", directory: "/workspaces/build/apps/examples/example1")
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_nextrpc_datatype", file: !82, line: 34, size: 224, elements: !84)
!84 = !{!85, !89, !90, !91}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "mux", scope: !83, file: !82, line: 35, baseType: !86, size: 32)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !87, line: 26, baseType: !88)
!87 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !15, line: 41, baseType: !34)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sec", scope: !83, file: !82, line: 36, baseType: !86, size: 32, offset: 32)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "typ", scope: !83, file: !82, line: 37, baseType: !86, size: 32, offset: 64)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !83, file: !82, line: 38, baseType: !92, size: 128, offset: 96)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "trailer_datatype", file: !82, line: 24, baseType: !93)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_trailer_datatype", file: !82, line: 18, size: 128, elements: !94)
!94 = !{!95, !96, !97, !98, !102}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !93, file: !82, line: 19, baseType: !12, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "rqr", scope: !93, file: !82, line: 20, baseType: !12, size: 32, offset: 32)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "oid", scope: !93, file: !82, line: 21, baseType: !12, size: 32, offset: 64)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "mid", scope: !93, file: !82, line: 22, baseType: !99, size: 16, offset: 96)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !13, line: 25, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !15, line: 40, baseType: !101)
!101 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "crc", scope: !93, file: !82, line: 23, baseType: !99, size: 16, offset: 112)
!103 = !DILocation(line: 138, column: 22, scope: !2)
!104 = !DILocation(line: 138, column: 5, scope: !2)
!105 = !DILocalVariable(name: "okay", scope: !2, file: !3, line: 143, type: !106)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "okay_datatype", file: !82, line: 51, baseType: !107)
!107 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_okay_datatype", file: !82, line: 48, size: 160, elements: !108)
!108 = !{!109, !110}
!109 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !107, file: !82, line: 49, baseType: !86, size: 32)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !107, file: !82, line: 50, baseType: !92, size: 128, offset: 32)
!111 = !DILocation(line: 143, column: 19, scope: !2)
!112 = !DILocation(line: 143, column: 5, scope: !2)
!113 = !DILocation(line: 149, column: 5, scope: !2)
!114 = !DILocation(line: 157, column: 10, scope: !115)
!115 = distinct !DILexicalBlock(scope: !2, file: !3, line: 157, column: 9)
!116 = !DILocation(line: 157, column: 9, scope: !2)
!117 = !DILocation(line: 158, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !3, line: 157, column: 18)
!119 = !DILocation(line: 159, column: 19, scope: !118)
!120 = !DILocation(line: 159, column: 17, scope: !118)
!121 = !DILocation(line: 160, column: 19, scope: !118)
!122 = !DILocation(line: 160, column: 17, scope: !118)
!123 = !DILocation(line: 161, column: 9, scope: !118)
!124 = !DILocation(line: 162, column: 5, scope: !118)
!125 = !DILocation(line: 173, column: 23, scope: !2)
!126 = !DILocation(line: 173, column: 32, scope: !2)
!127 = !DILocation(line: 173, column: 5, scope: !2)
!128 = !DILocation(line: 174, column: 5, scope: !2)
!129 = !DILocation(line: 175, column: 10, scope: !2)
!130 = !DILocation(line: 175, column: 12, scope: !2)
!131 = !DILocation(line: 176, column: 19, scope: !2)
!132 = !DILocation(line: 176, column: 28, scope: !2)
!133 = !DILocation(line: 176, column: 5, scope: !2)
!134 = !DILocation(line: 178, column: 22, scope: !2)
!135 = !DILocation(line: 178, column: 5, scope: !2)
!136 = !DILocation(line: 178, column: 12, scope: !2)
!137 = !DILocation(line: 178, column: 16, scope: !2)
!138 = !DILocation(line: 179, column: 22, scope: !2)
!139 = !DILocation(line: 179, column: 5, scope: !2)
!140 = !DILocation(line: 179, column: 12, scope: !2)
!141 = !DILocation(line: 179, column: 16, scope: !2)
!142 = !DILocation(line: 180, column: 22, scope: !2)
!143 = !DILocation(line: 180, column: 5, scope: !2)
!144 = !DILocation(line: 180, column: 12, scope: !2)
!145 = !DILocation(line: 180, column: 16, scope: !2)
!146 = !DILocation(line: 181, column: 1, scope: !2)
!147 = !DILocalVariable(name: "tag", arg: 1, scope: !33, file: !3, line: 183, type: !6)
!148 = !DILocation(line: 183, column: 38, scope: !33)
!149 = !DILocalVariable(name: "t_tag", scope: !33, file: !3, line: 204, type: !7)
!150 = !DILocation(line: 204, column: 14, scope: !33)
!151 = !DILocalVariable(name: "o_tag", scope: !33, file: !3, line: 205, type: !7)
!152 = !DILocation(line: 205, column: 14, scope: !33)
!153 = !DILocalVariable(name: "req_get_a", scope: !33, file: !3, line: 209, type: !154)
!154 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_a_datatype", file: !82, line: 61, baseType: !155)
!155 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_a_datatype", file: !82, line: 58, size: 160, elements: !156)
!156 = !{!157, !158}
!157 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !155, file: !82, line: 59, baseType: !86, size: 32)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !155, file: !82, line: 60, baseType: !92, size: 128, offset: 32)
!159 = !DILocation(line: 209, column: 28, scope: !33)
!160 = !DILocation(line: 209, column: 5, scope: !33)
!161 = !DILocation(line: 215, column: 5, scope: !33)
!162 = !DILocalVariable(name: "res_get_a", scope: !33, file: !3, line: 219, type: !163)
!163 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_a_datatype", file: !82, line: 71, baseType: !164)
!164 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_a_datatype", file: !82, line: 68, size: 192, elements: !165)
!165 = !{!166, !167}
!166 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !164, file: !82, line: 69, baseType: !45, size: 64)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !164, file: !82, line: 70, baseType: !92, size: 128, offset: 64)
!168 = !DILocation(line: 219, column: 29, scope: !33)
!169 = !DILocation(line: 219, column: 5, scope: !33)
!170 = !DILocation(line: 225, column: 5, scope: !33)
!171 = !DILocation(line: 233, column: 10, scope: !172)
!172 = distinct !DILexicalBlock(scope: !33, file: !3, line: 233, column: 9)
!173 = !DILocation(line: 233, column: 9, scope: !33)
!174 = !DILocation(line: 234, column: 16, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !3, line: 233, column: 18)
!176 = !DILocation(line: 235, column: 27, scope: !175)
!177 = !DILocation(line: 236, column: 19, scope: !175)
!178 = !DILocation(line: 236, column: 17, scope: !175)
!179 = !DILocation(line: 237, column: 19, scope: !175)
!180 = !DILocation(line: 237, column: 17, scope: !175)
!181 = !DILocation(line: 238, column: 9, scope: !175)
!182 = !DILocation(line: 239, column: 5, scope: !175)
!183 = !DILocation(line: 244, column: 23, scope: !33)
!184 = !DILocation(line: 244, column: 32, scope: !33)
!185 = !DILocation(line: 244, column: 5, scope: !33)
!186 = !DILocation(line: 246, column: 21, scope: !33)
!187 = !DILocation(line: 246, column: 15, scope: !33)
!188 = !DILocation(line: 246, column: 19, scope: !33)
!189 = !DILocalVariable(name: "reqId", scope: !33, file: !3, line: 256, type: !34)
!190 = !DILocation(line: 256, column: 9, scope: !33)
!191 = !DILocation(line: 256, column: 27, scope: !33)
!192 = !DILocation(line: 256, column: 35, scope: !33)
!193 = !DILocation(line: 257, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !33, file: !3, line: 257, column: 8)
!195 = !DILocation(line: 257, column: 16, scope: !194)
!196 = !DILocation(line: 257, column: 14, scope: !194)
!197 = !DILocation(line: 257, column: 8, scope: !33)
!198 = !DILocalVariable(name: "error", scope: !199, file: !3, line: 258, type: !53)
!199 = distinct !DILexicalBlock(scope: !194, file: !3, line: 257, column: 34)
!200 = !DILocation(line: 258, column: 14, scope: !199)
!201 = !DILocation(line: 259, column: 29, scope: !199)
!202 = !DILocation(line: 259, column: 27, scope: !199)
!203 = !DILocation(line: 260, column: 12, scope: !204)
!204 = distinct !DILexicalBlock(scope: !199, file: !3, line: 260, column: 12)
!205 = !DILocation(line: 260, column: 21, scope: !204)
!206 = !DILocation(line: 260, column: 18, scope: !204)
!207 = !DILocation(line: 260, column: 12, scope: !199)
!208 = !DILocation(line: 260, column: 59, scope: !204)
!209 = !DILocation(line: 260, column: 36, scope: !204)
!210 = !DILocation(line: 261, column: 33, scope: !199)
!211 = !DILocation(line: 261, column: 31, scope: !199)
!212 = !DILocation(line: 262, column: 32, scope: !199)
!213 = !DILocation(line: 262, column: 30, scope: !199)
!214 = !DILocation(line: 263, column: 23, scope: !199)
!215 = !DILocation(line: 264, column: 32, scope: !199)
!216 = !DILocation(line: 265, column: 33, scope: !199)
!217 = !DILocation(line: 265, column: 51, scope: !199)
!218 = !DILocation(line: 265, column: 58, scope: !199)
!219 = !DILocation(line: 265, column: 79, scope: !199)
!220 = !DILocation(line: 265, column: 56, scope: !199)
!221 = !DILocation(line: 265, column: 86, scope: !199)
!222 = !DILocation(line: 265, column: 84, scope: !199)
!223 = !DILocation(line: 265, column: 19, scope: !199)
!224 = !DILocation(line: 265, column: 27, scope: !199)
!225 = !DILocation(line: 265, column: 31, scope: !199)
!226 = !DILocation(line: 266, column: 25, scope: !199)
!227 = !DILocation(line: 266, column: 19, scope: !199)
!228 = !DILocation(line: 266, column: 23, scope: !199)
!229 = !DILocation(line: 267, column: 23, scope: !199)
!230 = !DILocation(line: 267, column: 32, scope: !199)
!231 = !DILocation(line: 267, column: 9, scope: !199)
!232 = !DILocation(line: 268, column: 5, scope: !199)
!233 = !DILocation(line: 269, column: 13, scope: !234)
!234 = distinct !DILexicalBlock(scope: !194, file: !3, line: 269, column: 13)
!235 = !DILocation(line: 269, column: 22, scope: !234)
!236 = !DILocation(line: 269, column: 19, scope: !234)
!237 = !DILocation(line: 269, column: 13, scope: !194)
!238 = !DILocation(line: 269, column: 73, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !3, line: 269, column: 40)
!240 = !DILocation(line: 269, column: 91, scope: !239)
!241 = !DILocation(line: 269, column: 98, scope: !239)
!242 = !DILocation(line: 269, column: 119, scope: !239)
!243 = !DILocation(line: 269, column: 96, scope: !239)
!244 = !DILocation(line: 269, column: 126, scope: !239)
!245 = !DILocation(line: 269, column: 124, scope: !239)
!246 = !DILocation(line: 269, column: 59, scope: !239)
!247 = !DILocation(line: 269, column: 67, scope: !239)
!248 = !DILocation(line: 269, column: 71, scope: !239)
!249 = !DILocation(line: 270, column: 25, scope: !239)
!250 = !DILocation(line: 270, column: 19, scope: !239)
!251 = !DILocation(line: 270, column: 23, scope: !239)
!252 = !DILocation(line: 271, column: 23, scope: !239)
!253 = !DILocation(line: 271, column: 32, scope: !239)
!254 = !DILocation(line: 271, column: 9, scope: !239)
!255 = !DILocation(line: 272, column: 5, scope: !239)
!256 = !DILocation(line: 273, column: 13, scope: !257)
!257 = distinct !DILexicalBlock(scope: !234, file: !3, line: 273, column: 13)
!258 = !DILocation(line: 273, column: 19, scope: !257)
!259 = !DILocation(line: 273, column: 13, scope: !234)
!260 = !DILocation(line: 274, column: 33, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !3, line: 273, column: 30)
!262 = !DILocation(line: 274, column: 51, scope: !261)
!263 = !DILocation(line: 274, column: 58, scope: !261)
!264 = !DILocation(line: 274, column: 79, scope: !261)
!265 = !DILocation(line: 274, column: 56, scope: !261)
!266 = !DILocation(line: 274, column: 86, scope: !261)
!267 = !DILocation(line: 274, column: 84, scope: !261)
!268 = !DILocation(line: 274, column: 19, scope: !261)
!269 = !DILocation(line: 274, column: 27, scope: !261)
!270 = !DILocation(line: 274, column: 31, scope: !261)
!271 = !DILocation(line: 275, column: 25, scope: !261)
!272 = !DILocation(line: 275, column: 19, scope: !261)
!273 = !DILocation(line: 275, column: 23, scope: !261)
!274 = !DILocation(line: 276, column: 25, scope: !261)
!275 = !DILocation(line: 276, column: 43, scope: !261)
!276 = !DILocation(line: 276, column: 23, scope: !261)
!277 = !DILocation(line: 277, column: 23, scope: !261)
!278 = !DILocation(line: 277, column: 32, scope: !261)
!279 = !DILocation(line: 277, column: 9, scope: !261)
!280 = !DILocation(line: 278, column: 5, scope: !261)
!281 = !DILocation(line: 279, column: 22, scope: !33)
!282 = !DILocation(line: 282, column: 1, scope: !33)
!283 = distinct !DISubprogram(name: "_wrapper_nextrpc", scope: !3, file: !3, line: 285, type: !284, scopeLine: 285, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!284 = !DISubroutineType(types: !285)
!285 = !{!28, !28}
!286 = !DILocalVariable(name: "tag", arg: 1, scope: !283, file: !3, line: 285, type: !28)
!287 = !DILocation(line: 285, column: 1, scope: !283)
!288 = !DILocation(line: 285, column: 1, scope: !289)
!289 = distinct !DILexicalBlock(scope: !283, file: !3, line: 285, column: 1)
!290 = distinct !{!290, !287, !287}
!291 = distinct !DISubprogram(name: "_wrapper_request_get_a", scope: !3, file: !3, line: 286, type: !284, scopeLine: 286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!292 = !DILocalVariable(name: "tag", arg: 1, scope: !291, file: !3, line: 286, type: !28)
!293 = !DILocation(line: 286, column: 1, scope: !291)
!294 = !DILocation(line: 286, column: 1, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !3, line: 286, column: 1)
!296 = distinct !{!296, !293, !293}
!297 = distinct !DISubprogram(name: "_slave_rpc_loop", scope: !3, file: !3, line: 288, type: !298, scopeLine: 288, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!298 = !DISubroutineType(types: !299)
!299 = !{!34}
!300 = !DILocalVariable(name: "n_tag", scope: !297, file: !3, line: 289, type: !7)
!301 = !DILocation(line: 289, column: 14, scope: !297)
!302 = !DILocalVariable(name: "tid", scope: !297, file: !3, line: 290, type: !303)
!303 = !DICompositeType(tag: DW_TAG_array_type, baseType: !304, size: 128, elements: !307)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !305, line: 27, baseType: !306)
!305 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "")
!306 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!307 = !{!308}
!308 = !DISubrange(count: 2)
!309 = !DILocation(line: 290, column: 15, scope: !297)
!310 = !DILocation(line: 291, column: 5, scope: !297)
!311 = !DILocation(line: 292, column: 21, scope: !297)
!312 = !DILocation(line: 292, column: 53, scope: !297)
!313 = !DILocation(line: 292, column: 5, scope: !297)
!314 = !DILocation(line: 293, column: 21, scope: !297)
!315 = !DILocation(line: 293, column: 59, scope: !297)
!316 = !DILocation(line: 293, column: 5, scope: !297)
!317 = !DILocalVariable(name: "i", scope: !318, file: !3, line: 294, type: !34)
!318 = distinct !DILexicalBlock(scope: !297, file: !3, line: 294, column: 5)
!319 = !DILocation(line: 294, column: 14, scope: !318)
!320 = !DILocation(line: 294, column: 10, scope: !318)
!321 = !DILocation(line: 294, column: 21, scope: !322)
!322 = distinct !DILexicalBlock(scope: !318, file: !3, line: 294, column: 5)
!323 = !DILocation(line: 294, column: 23, scope: !322)
!324 = !DILocation(line: 294, column: 5, scope: !318)
!325 = !DILocation(line: 294, column: 55, scope: !322)
!326 = !DILocation(line: 294, column: 51, scope: !322)
!327 = !DILocation(line: 294, column: 38, scope: !322)
!328 = !DILocation(line: 294, column: 34, scope: !322)
!329 = !DILocation(line: 294, column: 5, scope: !322)
!330 = distinct !{!330, !324, !331}
!331 = !DILocation(line: 294, column: 63, scope: !318)
!332 = !DILocation(line: 295, column: 5, scope: !297)
!333 = !{!334}
!334 = !{i64 2, i64 3, i1 false}
