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
@caller_restarted_get_a = external dso_local global i8, align 1
@.str.5 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_suborange\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_puborange\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_hal_init(i8* %0, i8* %1) #0 !dbg !54 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !57, metadata !DIExpression()), !dbg !58
  store i8* %1, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !59, metadata !DIExpression()), !dbg !60
  %5 = load i8*, i8** %3, align 8, !dbg !61
  %6 = call i8* @xdc_set_in(i8* %5), !dbg !62
  %7 = load i8*, i8** %4, align 8, !dbg !63
  %8 = call i8* @xdc_set_out(i8* %7), !dbg !64
  call void @xdc_register(void (i8*, i8*, i64*)* @nextrpc_data_encode, void (i8*, i8*, i64*)* @nextrpc_data_decode, i32 1), !dbg !65
  call void @xdc_register(void (i8*, i8*, i64*)* @okay_data_encode, void (i8*, i8*, i64*)* @okay_data_decode, i32 2), !dbg !66
  call void @xdc_register(void (i8*, i8*, i64*)* @request_get_a_data_encode, void (i8*, i8*, i64*)* @request_get_a_data_decode, i32 3), !dbg !67
  call void @xdc_register(void (i8*, i8*, i64*)* @response_get_a_data_encode, void (i8*, i8*, i64*)* @response_get_a_data_decode, i32 4), !dbg !68
  ret void, !dbg !69
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
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata %struct._nextrpc_datatype* %5, metadata !76, metadata !DIExpression()), !dbg !99
  %8 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !100
  call void @llvm.var.annotation(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 139), !dbg !100
  call void @llvm.dbg.declare(metadata %struct._okay_datatype* %6, metadata !101, metadata !DIExpression()), !dbg !107
  %9 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !108
  call void @llvm.var.annotation(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 144), !dbg !108
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 1), !dbg !109
  %10 = load i32, i32* @_handle_nextrpc.inited, align 4, !dbg !110
  %11 = icmp ne i32 %10, 0, !dbg !110
  br i1 %11, label %22, label %12, !dbg !112

12:                                               ; preds = %1
  store i32 1, i32* @_handle_nextrpc.inited, align 4, !dbg !113
  %13 = call i8* @xdc_pub_socket(), !dbg !115
  store i8* %13, i8** @_handle_nextrpc.psocket, align 8, !dbg !116
  %14 = bitcast { i64, i32 }* %7 to i8*, !dbg !117
  %15 = bitcast %struct._tag* %3 to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %14, i8* align 1 %15, i64 12, i1 false), !dbg !117
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !117
  %17 = load i64, i64* %16, align 1, !dbg !117
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !117
  %19 = load i32, i32* %18, align 1, !dbg !117
  %20 = call i8* @xdc_sub_socket(i64 %17, i32 %19), !dbg !117
  store i8* %20, i8** @_handle_nextrpc.ssocket, align 8, !dbg !118
  %21 = call i32 @sleep(i32 1), !dbg !119
  br label %22, !dbg !120

22:                                               ; preds = %12, %1
  %23 = load i8*, i8** @_handle_nextrpc.ssocket, align 8, !dbg !121
  %24 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !122
  call void @xdc_blocking_recv(i8* %23, i8* %24, %struct._tag* %3), !dbg !123
  call void @tag_write(%struct._tag* %4, i32 1, i32 1, i32 2), !dbg !124
  %25 = getelementptr inbounds %struct._okay_datatype, %struct._okay_datatype* %6, i32 0, i32 0, !dbg !125
  store i32 0, i32* %25, align 1, !dbg !126
  %26 = load i8*, i8** @_handle_nextrpc.psocket, align 8, !dbg !127
  %27 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !128
  call void @xdc_asyn_send(i8* %26, i8* %27, %struct._tag* %4), !dbg !129
  %28 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 0, !dbg !130
  %29 = load i32, i32* %28, align 1, !dbg !130
  %30 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !131
  %31 = getelementptr inbounds %struct._tag, %struct._tag* %30, i32 0, i32 0, !dbg !132
  store i32 %29, i32* %31, align 1, !dbg !133
  %32 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 1, !dbg !134
  %33 = load i32, i32* %32, align 1, !dbg !134
  %34 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !135
  %35 = getelementptr inbounds %struct._tag, %struct._tag* %34, i32 0, i32 1, !dbg !136
  store i32 %33, i32* %35, align 1, !dbg !137
  %36 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 2, !dbg !138
  %37 = load i32, i32* %36, align 1, !dbg !138
  %38 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !139
  %39 = getelementptr inbounds %struct._tag, %struct._tag* %38, i32 0, i32 2, !dbg !140
  store i32 %37, i32* %39, align 1, !dbg !141
  ret void, !dbg !142
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
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %5, metadata !149, metadata !DIExpression()), !dbg !155
  %10 = bitcast %struct._request_get_a_datatype* %5 to i8*, !dbg !156
  call void @llvm.var.annotation(i8* %10, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 211), !dbg !156
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 3), !dbg !157
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %6, metadata !158, metadata !DIExpression()), !dbg !164
  %11 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !165
  call void @llvm.var.annotation(i8* %11, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 221), !dbg !165
  call void @tag_write(%struct._tag* %4, i32 1, i32 1, i32 4), !dbg !166
  %12 = load i32, i32* @_handle_request_get_a.inited, align 4, !dbg !167
  %13 = icmp ne i32 %12, 0, !dbg !167
  br i1 %13, label %24, label %14, !dbg !169

14:                                               ; preds = %1
  store i32 1, i32* @_handle_request_get_a.inited, align 4, !dbg !170
  store i32 1, i32* @_handle_request_get_a.callee_restarted, align 4, !dbg !172
  %15 = call i8* @xdc_pub_socket(), !dbg !173
  store i8* %15, i8** @_handle_request_get_a.psocket, align 8, !dbg !174
  %16 = bitcast { i64, i32 }* %7 to i8*, !dbg !175
  %17 = bitcast %struct._tag* %3 to i8*, !dbg !175
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %16, i8* align 1 %17, i64 12, i1 false), !dbg !175
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !175
  %19 = load i64, i64* %18, align 1, !dbg !175
  %20 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !175
  %21 = load i32, i32* %20, align 1, !dbg !175
  %22 = call i8* @xdc_sub_socket(i64 %19, i32 %21), !dbg !175
  store i8* %22, i8** @_handle_request_get_a.ssocket, align 8, !dbg !176
  %23 = call i32 @sleep(i32 1), !dbg !177
  br label %24, !dbg !178

24:                                               ; preds = %14, %1
  %25 = load i8*, i8** @_handle_request_get_a.ssocket, align 8, !dbg !179
  %26 = bitcast %struct._request_get_a_datatype* %5 to i8*, !dbg !180
  call void @xdc_blocking_recv(i8* %25, i8* %26, %struct._tag* %3), !dbg !181
  %27 = call double (...) @get_a(), !dbg !182
  %28 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !183
  store double %27, double* %28, align 1, !dbg !184
  call void @llvm.dbg.declare(metadata i32* %8, metadata !185, metadata !DIExpression()), !dbg !186
  %29 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %5, i32 0, i32 1, !dbg !187
  %30 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %29, i32 0, i32 0, !dbg !188
  %31 = load i32, i32* %30, align 1, !dbg !188
  store i32 %31, i32* %8, align 4, !dbg !186
  %32 = load i32, i32* %8, align 4, !dbg !189
  %33 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !191
  %34 = icmp sgt i32 %32, %33, !dbg !192
  br i1 %34, label %35, label %59, !dbg !193

35:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata i8* %9, metadata !194, metadata !DIExpression()), !dbg !197
  store i8 0, i8* %9, align 1, !dbg !197
  %36 = load i32, i32* %8, align 4, !dbg !198
  store i32 %36, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !199
  %37 = load i32, i32* %8, align 4, !dbg !200
  %38 = load i32, i32* @_handle_request_get_a.restart_state, align 4, !dbg !202
  %39 = icmp eq i32 %37, %38, !dbg !203
  br i1 %39, label %40, label %41, !dbg !204

40:                                               ; preds = %35
  store i8 1, i8* @caller_restarted_get_a, align 1, !dbg !205
  br label %41, !dbg !206

41:                                               ; preds = %40, %35
  %42 = call double (...) @get_a(), !dbg !207
  store double %42, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !208
  %43 = load i8, i8* %9, align 1, !dbg !209
  %44 = trunc i8 %43 to i1, !dbg !209
  %45 = zext i1 %44 to i32, !dbg !209
  store i32 %45, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !210
  store i32 -1, i32* @_handle_request_get_a.restart_state, align 4, !dbg !211
  store i8 0, i8* @caller_restarted_get_a, align 1, !dbg !212
  %46 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !213
  %47 = shl i32 %46, 2, !dbg !214
  %48 = load i32, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !215
  %49 = shl i32 %48, 1, !dbg !216
  %50 = or i32 %47, %49, !dbg !217
  %51 = load i32, i32* @_handle_request_get_a.callee_restarted, align 4, !dbg !218
  %52 = or i32 %50, %51, !dbg !219
  %53 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 1, !dbg !220
  %54 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %53, i32 0, i32 0, !dbg !221
  store i32 %52, i32* %54, align 1, !dbg !222
  %55 = load double, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !223
  %56 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !224
  store double %55, double* %56, align 1, !dbg !225
  %57 = load i8*, i8** @_handle_request_get_a.psocket, align 8, !dbg !226
  %58 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !227
  call void @xdc_asyn_send(i8* %57, i8* %58, %struct._tag* %4), !dbg !228
  br label %98, !dbg !229

59:                                               ; preds = %24
  %60 = load i32, i32* %8, align 4, !dbg !230
  %61 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !232
  %62 = icmp eq i32 %60, %61, !dbg !233
  br i1 %62, label %63, label %77, !dbg !234

63:                                               ; preds = %59
  %64 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !235
  %65 = shl i32 %64, 2, !dbg !237
  %66 = load i32, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !238
  %67 = shl i32 %66, 1, !dbg !239
  %68 = or i32 %65, %67, !dbg !240
  %69 = load i32, i32* @_handle_request_get_a.callee_restarted, align 4, !dbg !241
  %70 = or i32 %68, %69, !dbg !242
  %71 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 1, !dbg !243
  %72 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %71, i32 0, i32 0, !dbg !244
  store i32 %70, i32* %72, align 1, !dbg !245
  %73 = load double, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !246
  %74 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !247
  store double %73, double* %74, align 1, !dbg !248
  %75 = load i8*, i8** @_handle_request_get_a.psocket, align 8, !dbg !249
  %76 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !250
  call void @xdc_asyn_send(i8* %75, i8* %76, %struct._tag* %4), !dbg !251
  br label %97, !dbg !252

77:                                               ; preds = %59
  %78 = load i32, i32* %8, align 4, !dbg !253
  %79 = icmp eq i32 %78, -2147483648, !dbg !255
  br i1 %79, label %80, label %96, !dbg !256

80:                                               ; preds = %77
  %81 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !257
  %82 = shl i32 %81, 2, !dbg !259
  %83 = load i32, i32* @_handle_request_get_a.last_processed_error, align 4, !dbg !260
  %84 = shl i32 %83, 1, !dbg !261
  %85 = or i32 %82, %84, !dbg !262
  %86 = load i32, i32* @_handle_request_get_a.callee_restarted, align 4, !dbg !263
  %87 = or i32 %85, %86, !dbg !264
  %88 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 1, !dbg !265
  %89 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %88, i32 0, i32 0, !dbg !266
  store i32 %87, i32* %89, align 1, !dbg !267
  %90 = load double, double* @_handle_request_get_a.last_processed_result, align 8, !dbg !268
  %91 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !269
  store double %90, double* %91, align 1, !dbg !270
  %92 = load i32, i32* @_handle_request_get_a.processed_counter, align 4, !dbg !271
  %93 = add nsw i32 %92, 1, !dbg !272
  store i32 %93, i32* @_handle_request_get_a.restart_state, align 4, !dbg !273
  %94 = load i8*, i8** @_handle_request_get_a.psocket, align 8, !dbg !274
  %95 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !275
  call void @xdc_asyn_send(i8* %94, i8* %95, %struct._tag* %4), !dbg !276
  br label %96, !dbg !277

96:                                               ; preds = %80, %77
  br label %97

97:                                               ; preds = %96, %63
  br label %98

98:                                               ; preds = %97, %41
  store i32 0, i32* @_handle_request_get_a.callee_restarted, align 4, !dbg !278
  ret void, !dbg !279
}

declare dso_local double @get_a(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_wrapper_nextrpc(i8* %0) #0 !dbg !280 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !283, metadata !DIExpression()), !dbg !284
  br label %3, !dbg !284

3:                                                ; preds = %1, %3
  %4 = load i8*, i8** %2, align 8, !dbg !285
  %5 = bitcast i8* %4 to %struct._tag*, !dbg !285
  call void @_handle_nextrpc(%struct._tag* %5), !dbg !285
  br label %3, !dbg !284, !llvm.loop !287
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_wrapper_request_get_a(i8* %0) #0 !dbg !288 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !289, metadata !DIExpression()), !dbg !290
  br label %3, !dbg !290

3:                                                ; preds = %1, %3
  %4 = load i8*, i8** %2, align 8, !dbg !291
  %5 = bitcast i8* %4 to %struct._tag*, !dbg !291
  call void @_handle_request_get_a(%struct._tag* %5), !dbg !291
  br label %3, !dbg !290, !llvm.loop !293
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_slave_rpc_loop() #0 !dbg !294 {
  %1 = alloca %struct._tag, align 1
  %2 = alloca [2 x i64], align 16
  %3 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct._tag* %1, metadata !297, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.declare(metadata [2 x i64]* %2, metadata !299, metadata !DIExpression()), !dbg !306
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0)), !dbg !307
  %4 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 0, !dbg !308
  %5 = bitcast %struct._tag* %1 to i8*, !dbg !309
  %6 = call i32 @pthread_create(i64* %4, %union.pthread_attr_t* null, i8* (i8*)* @_wrapper_nextrpc, i8* %5) #6, !dbg !310
  %7 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 1, !dbg !311
  %8 = bitcast %struct._tag* %1 to i8*, !dbg !312
  %9 = call i32 @pthread_create(i64* %7, %union.pthread_attr_t* null, i8* (i8*)* @_wrapper_request_get_a, i8* %8) #6, !dbg !313
  call void @llvm.dbg.declare(metadata i32* %3, metadata !314, metadata !DIExpression()), !dbg !316
  store i32 0, i32* %3, align 4, !dbg !316
  br label %10, !dbg !317

10:                                               ; preds = %19, %0
  %11 = load i32, i32* %3, align 4, !dbg !318
  %12 = icmp slt i32 %11, 2, !dbg !320
  br i1 %12, label %13, label %22, !dbg !321

13:                                               ; preds = %10
  %14 = load i32, i32* %3, align 4, !dbg !322
  %15 = sext i32 %14 to i64, !dbg !323
  %16 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 %15, !dbg !323
  %17 = load i64, i64* %16, align 8, !dbg !323
  %18 = call i32 @pthread_join(i64 %17, i8** null), !dbg !324
  br label %19, !dbg !324

19:                                               ; preds = %13
  %20 = load i32, i32* %3, align 4, !dbg !325
  %21 = add nsw i32 %20, 1, !dbg !325
  store i32 %21, i32* %3, align 4, !dbg !325
  br label %10, !dbg !326, !llvm.loop !327

22:                                               ; preds = %10
  ret i32 0, !dbg !329
}

; Function Attrs: nounwind
declare !callback !330 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #5

declare dso_local i32 @pthread_join(i64, i8**) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!50, !51, !52}
!llvm.ident = !{!53}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "inited", scope: !2, file: !3, line: 131, type: !34, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "_handle_nextrpc", scope: !3, file: !3, line: 118, type: !4, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
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
!25 = !{!0, !26, !29, !31, !35, !37, !39, !41, !43, !46, !48}
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "psocket", scope: !2, file: !3, line: 132, type: !28, isLocal: true, isDefinition: true)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "ssocket", scope: !2, file: !3, line: 133, type: !28, isLocal: true, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "inited", scope: !33, file: !3, line: 197, type: !34, isLocal: true, isDefinition: true)
!33 = distinct !DISubprogram(name: "_handle_request_get_a", scope: !3, file: !3, line: 184, type: !4, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "psocket", scope: !33, file: !3, line: 198, type: !28, isLocal: true, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "ssocket", scope: !33, file: !3, line: 199, type: !28, isLocal: true, isDefinition: true)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "processed_counter", scope: !33, file: !3, line: 201, type: !34, isLocal: true, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "restart_state", scope: !33, file: !3, line: 202, type: !34, isLocal: true, isDefinition: true)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(name: "last_processed_result", scope: !33, file: !3, line: 203, type: !45, isLocal: true, isDefinition: true)
!45 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "last_processed_error", scope: !33, file: !3, line: 204, type: !34, isLocal: true, isDefinition: true)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(name: "callee_restarted", scope: !33, file: !3, line: 205, type: !34, isLocal: true, isDefinition: true)
!50 = !{i32 7, !"Dwarf Version", i32 4}
!51 = !{i32 2, !"Debug Info Version", i32 3}
!52 = !{i32 1, !"wchar_size", i32 4}
!53 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!54 = distinct !DISubprogram(name: "_hal_init", scope: !3, file: !3, line: 107, type: !55, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!55 = !DISubroutineType(types: !56)
!56 = !{null, !23, !23}
!57 = !DILocalVariable(name: "inuri", arg: 1, scope: !54, file: !3, line: 107, type: !23)
!58 = !DILocation(line: 107, column: 22, scope: !54)
!59 = !DILocalVariable(name: "outuri", arg: 2, scope: !54, file: !3, line: 107, type: !23)
!60 = !DILocation(line: 107, column: 35, scope: !54)
!61 = !DILocation(line: 109, column: 16, scope: !54)
!62 = !DILocation(line: 109, column: 5, scope: !54)
!63 = !DILocation(line: 110, column: 17, scope: !54)
!64 = !DILocation(line: 110, column: 5, scope: !54)
!65 = !DILocation(line: 111, column: 5, scope: !54)
!66 = !DILocation(line: 112, column: 5, scope: !54)
!67 = !DILocation(line: 113, column: 5, scope: !54)
!68 = !DILocation(line: 114, column: 5, scope: !54)
!69 = !DILocation(line: 116, column: 1, scope: !54)
!70 = !DILocalVariable(name: "n_tag", arg: 1, scope: !2, file: !3, line: 118, type: !6)
!71 = !DILocation(line: 118, column: 32, scope: !2)
!72 = !DILocalVariable(name: "t_tag", scope: !2, file: !3, line: 134, type: !7)
!73 = !DILocation(line: 134, column: 14, scope: !2)
!74 = !DILocalVariable(name: "o_tag", scope: !2, file: !3, line: 135, type: !7)
!75 = !DILocation(line: 135, column: 14, scope: !2)
!76 = !DILocalVariable(name: "nxt", scope: !2, file: !3, line: 139, type: !77)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "nextrpc_datatype", file: !78, line: 39, baseType: !79)
!78 = !DIFile(filename: "./partitioned/multithreaded/autogen/codec.h", directory: "/workspaces/build/apps/examples/example1")
!79 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_nextrpc_datatype", file: !78, line: 34, size: 224, elements: !80)
!80 = !{!81, !85, !86, !87}
!81 = !DIDerivedType(tag: DW_TAG_member, name: "mux", scope: !79, file: !78, line: 35, baseType: !82, size: 32)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !83, line: 26, baseType: !84)
!83 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !15, line: 41, baseType: !34)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sec", scope: !79, file: !78, line: 36, baseType: !82, size: 32, offset: 32)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "typ", scope: !79, file: !78, line: 37, baseType: !82, size: 32, offset: 64)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !79, file: !78, line: 38, baseType: !88, size: 128, offset: 96)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "trailer_datatype", file: !78, line: 24, baseType: !89)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_trailer_datatype", file: !78, line: 18, size: 128, elements: !90)
!90 = !{!91, !92, !93, !94, !98}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !89, file: !78, line: 19, baseType: !12, size: 32)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "rqr", scope: !89, file: !78, line: 20, baseType: !12, size: 32, offset: 32)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "oid", scope: !89, file: !78, line: 21, baseType: !12, size: 32, offset: 64)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "mid", scope: !89, file: !78, line: 22, baseType: !95, size: 16, offset: 96)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !13, line: 25, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !15, line: 40, baseType: !97)
!97 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "crc", scope: !89, file: !78, line: 23, baseType: !95, size: 16, offset: 112)
!99 = !DILocation(line: 139, column: 22, scope: !2)
!100 = !DILocation(line: 139, column: 5, scope: !2)
!101 = !DILocalVariable(name: "okay", scope: !2, file: !3, line: 144, type: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "okay_datatype", file: !78, line: 51, baseType: !103)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_okay_datatype", file: !78, line: 48, size: 160, elements: !104)
!104 = !{!105, !106}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !103, file: !78, line: 49, baseType: !82, size: 32)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !103, file: !78, line: 50, baseType: !88, size: 128, offset: 32)
!107 = !DILocation(line: 144, column: 19, scope: !2)
!108 = !DILocation(line: 144, column: 5, scope: !2)
!109 = !DILocation(line: 150, column: 5, scope: !2)
!110 = !DILocation(line: 158, column: 10, scope: !111)
!111 = distinct !DILexicalBlock(scope: !2, file: !3, line: 158, column: 9)
!112 = !DILocation(line: 158, column: 9, scope: !2)
!113 = !DILocation(line: 159, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !3, line: 158, column: 18)
!115 = !DILocation(line: 160, column: 19, scope: !114)
!116 = !DILocation(line: 160, column: 17, scope: !114)
!117 = !DILocation(line: 161, column: 19, scope: !114)
!118 = !DILocation(line: 161, column: 17, scope: !114)
!119 = !DILocation(line: 162, column: 9, scope: !114)
!120 = !DILocation(line: 163, column: 5, scope: !114)
!121 = !DILocation(line: 174, column: 23, scope: !2)
!122 = !DILocation(line: 174, column: 32, scope: !2)
!123 = !DILocation(line: 174, column: 5, scope: !2)
!124 = !DILocation(line: 175, column: 5, scope: !2)
!125 = !DILocation(line: 176, column: 10, scope: !2)
!126 = !DILocation(line: 176, column: 12, scope: !2)
!127 = !DILocation(line: 177, column: 19, scope: !2)
!128 = !DILocation(line: 177, column: 28, scope: !2)
!129 = !DILocation(line: 177, column: 5, scope: !2)
!130 = !DILocation(line: 179, column: 22, scope: !2)
!131 = !DILocation(line: 179, column: 5, scope: !2)
!132 = !DILocation(line: 179, column: 12, scope: !2)
!133 = !DILocation(line: 179, column: 16, scope: !2)
!134 = !DILocation(line: 180, column: 22, scope: !2)
!135 = !DILocation(line: 180, column: 5, scope: !2)
!136 = !DILocation(line: 180, column: 12, scope: !2)
!137 = !DILocation(line: 180, column: 16, scope: !2)
!138 = !DILocation(line: 181, column: 22, scope: !2)
!139 = !DILocation(line: 181, column: 5, scope: !2)
!140 = !DILocation(line: 181, column: 12, scope: !2)
!141 = !DILocation(line: 181, column: 16, scope: !2)
!142 = !DILocation(line: 182, column: 1, scope: !2)
!143 = !DILocalVariable(name: "tag", arg: 1, scope: !33, file: !3, line: 184, type: !6)
!144 = !DILocation(line: 184, column: 38, scope: !33)
!145 = !DILocalVariable(name: "t_tag", scope: !33, file: !3, line: 206, type: !7)
!146 = !DILocation(line: 206, column: 14, scope: !33)
!147 = !DILocalVariable(name: "o_tag", scope: !33, file: !3, line: 207, type: !7)
!148 = !DILocation(line: 207, column: 14, scope: !33)
!149 = !DILocalVariable(name: "req_get_a", scope: !33, file: !3, line: 211, type: !150)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_a_datatype", file: !78, line: 61, baseType: !151)
!151 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_a_datatype", file: !78, line: 58, size: 160, elements: !152)
!152 = !{!153, !154}
!153 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !151, file: !78, line: 59, baseType: !82, size: 32)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !151, file: !78, line: 60, baseType: !88, size: 128, offset: 32)
!155 = !DILocation(line: 211, column: 28, scope: !33)
!156 = !DILocation(line: 211, column: 5, scope: !33)
!157 = !DILocation(line: 217, column: 5, scope: !33)
!158 = !DILocalVariable(name: "res_get_a", scope: !33, file: !3, line: 221, type: !159)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_a_datatype", file: !78, line: 71, baseType: !160)
!160 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_a_datatype", file: !78, line: 68, size: 192, elements: !161)
!161 = !{!162, !163}
!162 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !160, file: !78, line: 69, baseType: !45, size: 64)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !160, file: !78, line: 70, baseType: !88, size: 128, offset: 64)
!164 = !DILocation(line: 221, column: 29, scope: !33)
!165 = !DILocation(line: 221, column: 5, scope: !33)
!166 = !DILocation(line: 227, column: 5, scope: !33)
!167 = !DILocation(line: 235, column: 10, scope: !168)
!168 = distinct !DILexicalBlock(scope: !33, file: !3, line: 235, column: 9)
!169 = !DILocation(line: 235, column: 9, scope: !33)
!170 = !DILocation(line: 236, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !3, line: 235, column: 18)
!172 = !DILocation(line: 238, column: 26, scope: !171)
!173 = !DILocation(line: 240, column: 19, scope: !171)
!174 = !DILocation(line: 240, column: 17, scope: !171)
!175 = !DILocation(line: 241, column: 19, scope: !171)
!176 = !DILocation(line: 241, column: 17, scope: !171)
!177 = !DILocation(line: 242, column: 9, scope: !171)
!178 = !DILocation(line: 243, column: 5, scope: !171)
!179 = !DILocation(line: 248, column: 23, scope: !33)
!180 = !DILocation(line: 248, column: 32, scope: !33)
!181 = !DILocation(line: 248, column: 5, scope: !33)
!182 = !DILocation(line: 250, column: 21, scope: !33)
!183 = !DILocation(line: 250, column: 15, scope: !33)
!184 = !DILocation(line: 250, column: 19, scope: !33)
!185 = !DILocalVariable(name: "reqId", scope: !33, file: !3, line: 261, type: !34)
!186 = !DILocation(line: 261, column: 9, scope: !33)
!187 = !DILocation(line: 261, column: 27, scope: !33)
!188 = !DILocation(line: 261, column: 35, scope: !33)
!189 = !DILocation(line: 262, column: 5, scope: !190)
!190 = distinct !DILexicalBlock(scope: !33, file: !3, line: 262, column: 5)
!191 = !DILocation(line: 262, column: 13, scope: !190)
!192 = !DILocation(line: 262, column: 11, scope: !190)
!193 = !DILocation(line: 262, column: 5, scope: !33)
!194 = !DILocalVariable(name: "error", scope: !195, file: !3, line: 263, type: !196)
!195 = distinct !DILexicalBlock(scope: !190, file: !3, line: 262, column: 31)
!196 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!197 = !DILocation(line: 263, column: 8, scope: !195)
!198 = !DILocation(line: 264, column: 23, scope: !195)
!199 = !DILocation(line: 264, column: 21, scope: !195)
!200 = !DILocation(line: 265, column: 6, scope: !201)
!201 = distinct !DILexicalBlock(scope: !195, file: !3, line: 265, column: 6)
!202 = !DILocation(line: 265, column: 15, scope: !201)
!203 = !DILocation(line: 265, column: 12, scope: !201)
!204 = !DILocation(line: 265, column: 6, scope: !195)
!205 = !DILocation(line: 265, column: 53, scope: !201)
!206 = !DILocation(line: 265, column: 30, scope: !201)
!207 = !DILocation(line: 266, column: 27, scope: !195)
!208 = !DILocation(line: 266, column: 25, scope: !195)
!209 = !DILocation(line: 267, column: 26, scope: !195)
!210 = !DILocation(line: 267, column: 24, scope: !195)
!211 = !DILocation(line: 268, column: 17, scope: !195)
!212 = !DILocation(line: 269, column: 26, scope: !195)
!213 = !DILocation(line: 270, column: 27, scope: !195)
!214 = !DILocation(line: 270, column: 45, scope: !195)
!215 = !DILocation(line: 270, column: 52, scope: !195)
!216 = !DILocation(line: 270, column: 73, scope: !195)
!217 = !DILocation(line: 270, column: 50, scope: !195)
!218 = !DILocation(line: 270, column: 80, scope: !195)
!219 = !DILocation(line: 270, column: 78, scope: !195)
!220 = !DILocation(line: 270, column: 13, scope: !195)
!221 = !DILocation(line: 270, column: 21, scope: !195)
!222 = !DILocation(line: 270, column: 25, scope: !195)
!223 = !DILocation(line: 271, column: 19, scope: !195)
!224 = !DILocation(line: 271, column: 13, scope: !195)
!225 = !DILocation(line: 271, column: 17, scope: !195)
!226 = !DILocation(line: 272, column: 17, scope: !195)
!227 = !DILocation(line: 272, column: 26, scope: !195)
!228 = !DILocation(line: 272, column: 3, scope: !195)
!229 = !DILocation(line: 273, column: 2, scope: !195)
!230 = !DILocation(line: 274, column: 10, scope: !231)
!231 = distinct !DILexicalBlock(scope: !190, file: !3, line: 274, column: 10)
!232 = !DILocation(line: 274, column: 19, scope: !231)
!233 = !DILocation(line: 274, column: 16, scope: !231)
!234 = !DILocation(line: 274, column: 10, scope: !190)
!235 = !DILocation(line: 275, column: 27, scope: !236)
!236 = distinct !DILexicalBlock(scope: !231, file: !3, line: 274, column: 37)
!237 = !DILocation(line: 275, column: 45, scope: !236)
!238 = !DILocation(line: 275, column: 52, scope: !236)
!239 = !DILocation(line: 275, column: 73, scope: !236)
!240 = !DILocation(line: 275, column: 50, scope: !236)
!241 = !DILocation(line: 275, column: 80, scope: !236)
!242 = !DILocation(line: 275, column: 78, scope: !236)
!243 = !DILocation(line: 275, column: 13, scope: !236)
!244 = !DILocation(line: 275, column: 21, scope: !236)
!245 = !DILocation(line: 275, column: 25, scope: !236)
!246 = !DILocation(line: 276, column: 19, scope: !236)
!247 = !DILocation(line: 276, column: 13, scope: !236)
!248 = !DILocation(line: 276, column: 17, scope: !236)
!249 = !DILocation(line: 277, column: 17, scope: !236)
!250 = !DILocation(line: 277, column: 26, scope: !236)
!251 = !DILocation(line: 277, column: 3, scope: !236)
!252 = !DILocation(line: 278, column: 2, scope: !236)
!253 = !DILocation(line: 279, column: 10, scope: !254)
!254 = distinct !DILexicalBlock(scope: !231, file: !3, line: 279, column: 10)
!255 = !DILocation(line: 279, column: 16, scope: !254)
!256 = !DILocation(line: 279, column: 10, scope: !231)
!257 = !DILocation(line: 280, column: 27, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !3, line: 279, column: 27)
!259 = !DILocation(line: 280, column: 45, scope: !258)
!260 = !DILocation(line: 280, column: 52, scope: !258)
!261 = !DILocation(line: 280, column: 73, scope: !258)
!262 = !DILocation(line: 280, column: 50, scope: !258)
!263 = !DILocation(line: 280, column: 80, scope: !258)
!264 = !DILocation(line: 280, column: 78, scope: !258)
!265 = !DILocation(line: 280, column: 13, scope: !258)
!266 = !DILocation(line: 280, column: 21, scope: !258)
!267 = !DILocation(line: 280, column: 25, scope: !258)
!268 = !DILocation(line: 281, column: 19, scope: !258)
!269 = !DILocation(line: 281, column: 13, scope: !258)
!270 = !DILocation(line: 281, column: 17, scope: !258)
!271 = !DILocation(line: 282, column: 19, scope: !258)
!272 = !DILocation(line: 282, column: 37, scope: !258)
!273 = !DILocation(line: 282, column: 17, scope: !258)
!274 = !DILocation(line: 283, column: 17, scope: !258)
!275 = !DILocation(line: 283, column: 26, scope: !258)
!276 = !DILocation(line: 283, column: 3, scope: !258)
!277 = !DILocation(line: 284, column: 5, scope: !258)
!278 = !DILocation(line: 286, column: 19, scope: !33)
!279 = !DILocation(line: 292, column: 1, scope: !33)
!280 = distinct !DISubprogram(name: "_wrapper_nextrpc", scope: !3, file: !3, line: 295, type: !281, scopeLine: 295, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!281 = !DISubroutineType(types: !282)
!282 = !{!28, !28}
!283 = !DILocalVariable(name: "tag", arg: 1, scope: !280, file: !3, line: 295, type: !28)
!284 = !DILocation(line: 295, column: 1, scope: !280)
!285 = !DILocation(line: 295, column: 1, scope: !286)
!286 = distinct !DILexicalBlock(scope: !280, file: !3, line: 295, column: 1)
!287 = distinct !{!287, !284, !284}
!288 = distinct !DISubprogram(name: "_wrapper_request_get_a", scope: !3, file: !3, line: 296, type: !281, scopeLine: 296, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!289 = !DILocalVariable(name: "tag", arg: 1, scope: !288, file: !3, line: 296, type: !28)
!290 = !DILocation(line: 296, column: 1, scope: !288)
!291 = !DILocation(line: 296, column: 1, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !3, line: 296, column: 1)
!293 = distinct !{!293, !290, !290}
!294 = distinct !DISubprogram(name: "_slave_rpc_loop", scope: !3, file: !3, line: 298, type: !295, scopeLine: 298, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!295 = !DISubroutineType(types: !296)
!296 = !{!34}
!297 = !DILocalVariable(name: "n_tag", scope: !294, file: !3, line: 299, type: !7)
!298 = !DILocation(line: 299, column: 14, scope: !294)
!299 = !DILocalVariable(name: "tid", scope: !294, file: !3, line: 300, type: !300)
!300 = !DICompositeType(tag: DW_TAG_array_type, baseType: !301, size: 128, elements: !304)
!301 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !302, line: 27, baseType: !303)
!302 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "")
!303 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!304 = !{!305}
!305 = !DISubrange(count: 2)
!306 = !DILocation(line: 300, column: 15, scope: !294)
!307 = !DILocation(line: 301, column: 5, scope: !294)
!308 = !DILocation(line: 302, column: 21, scope: !294)
!309 = !DILocation(line: 302, column: 53, scope: !294)
!310 = !DILocation(line: 302, column: 5, scope: !294)
!311 = !DILocation(line: 303, column: 21, scope: !294)
!312 = !DILocation(line: 303, column: 59, scope: !294)
!313 = !DILocation(line: 303, column: 5, scope: !294)
!314 = !DILocalVariable(name: "i", scope: !315, file: !3, line: 304, type: !34)
!315 = distinct !DILexicalBlock(scope: !294, file: !3, line: 304, column: 5)
!316 = !DILocation(line: 304, column: 14, scope: !315)
!317 = !DILocation(line: 304, column: 10, scope: !315)
!318 = !DILocation(line: 304, column: 21, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !3, line: 304, column: 5)
!320 = !DILocation(line: 304, column: 23, scope: !319)
!321 = !DILocation(line: 304, column: 5, scope: !315)
!322 = !DILocation(line: 304, column: 55, scope: !319)
!323 = !DILocation(line: 304, column: 51, scope: !319)
!324 = !DILocation(line: 304, column: 38, scope: !319)
!325 = !DILocation(line: 304, column: 34, scope: !319)
!326 = !DILocation(line: 304, column: 5, scope: !319)
!327 = distinct !{!327, !321, !328}
!328 = !DILocation(line: 304, column: 63, scope: !315)
!329 = !DILocation(line: 305, column: 5, scope: !294)
!330 = !{!331}
!331 = !{i64 2, i64 3, i1 false}
