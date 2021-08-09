; ModuleID = './partitioned/multithreaded/purple/purple_rpc.c'
source_filename = "./partitioned/multithreaded/purple/purple_rpc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._tag = type { i32, i32, i32 }
%struct._nextrpc_datatype = type { i32, i32, i32, %struct._trailer_datatype }
%struct._trailer_datatype = type { i32, i32, i32, i16, i16 }
%struct._okay_datatype = type { i32, %struct._trailer_datatype }
%struct._request_get_ewma_datatype = type { double, %struct._trailer_datatype }
%struct._response_get_ewma_datatype = type { double, %struct._trailer_datatype }
%union.pthread_attr_t = type { i64, [48 x i8] }

@_handle_nextrpc.inited = internal global i32 0, align 4, !dbg !0
@_handle_nextrpc.psocket = internal global i8* null, align 8, !dbg !26
@_handle_nextrpc.ssocket = internal global i8* null, align 8, !dbg !29
@.str = private unnamed_addr constant [12 x i8] c"TAG_NEXTRPC\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [48 x i8] c"./partitioned/multithreaded/purple/purple_rpc.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [9 x i8] c"TAG_OKAY\00", section "llvm.metadata"
@_handle_request_get_ewma.inited = internal global i32 0, align 4, !dbg !31
@_handle_request_get_ewma.psocket = internal global i8* null, align 8, !dbg !35
@_handle_request_get_ewma.ssocket = internal global i8* null, align 8, !dbg !37
@_handle_request_get_ewma.processed_counter = internal global i32 0, align 4, !dbg !39
@_handle_request_get_ewma.restart_state = internal global i32 -1, align 4, !dbg !41
@_handle_request_get_ewma.last_processed_result = internal global double 0.000000e+00, align 8, !dbg !43
@_handle_request_get_ewma.last_processed_error = internal global i32 0, align 4, !dbg !46
@_handle_request_get_ewma.callee_restarted = internal global i32 0, align 4, !dbg !48
@.str.3 = private unnamed_addr constant [21 x i8] c"TAG_REQUEST_GET_EWMA\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [22 x i8] c"TAG_RESPONSE_GET_EWMA\00", section "llvm.metadata"
@caller_restarted_get_ewma = common dso_local global i8 0, align 1, !dbg !50
@.str.5 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_subpurple\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_pubpurple\00", align 1

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
  call void @xdc_register(void (i8*, i8*, i64*)* @request_get_ewma_data_encode, void (i8*, i8*, i64*)* @request_get_ewma_data_decode, i32 3), !dbg !71
  call void @xdc_register(void (i8*, i8*, i64*)* @response_get_ewma_data_encode, void (i8*, i8*, i64*)* @response_get_ewma_data_decode, i32 4), !dbg !72
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

declare dso_local void @request_get_ewma_data_encode(i8*, i8*, i64*) #2

declare dso_local void @request_get_ewma_data_decode(i8*, i8*, i64*) #2

declare dso_local void @response_get_ewma_data_encode(i8*, i8*, i64*) #2

declare dso_local void @response_get_ewma_data_decode(i8*, i8*, i64*) #2

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
  call void @tag_write(%struct._tag* %3, i32 1, i32 1, i32 1), !dbg !113
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
  call void @tag_write(%struct._tag* %4, i32 2, i32 2, i32 2), !dbg !128
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
define dso_local void @_handle_request_get_ewma(%struct._tag* %0) #0 !dbg !33 {
  %2 = alloca %struct._tag*, align 8
  %3 = alloca %struct._tag, align 1
  %4 = alloca %struct._tag, align 1
  %5 = alloca %struct._request_get_ewma_datatype, align 1
  %6 = alloca %struct._response_get_ewma_datatype, align 1
  %7 = alloca { i64, i32 }, align 1
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  store %struct._tag* %0, %struct._tag** %2, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %5, metadata !153, metadata !DIExpression()), !dbg !159
  %10 = bitcast %struct._request_get_ewma_datatype* %5 to i8*, !dbg !160
  call void @llvm.var.annotation(i8* %10, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 209), !dbg !160
  call void @tag_write(%struct._tag* %3, i32 1, i32 1, i32 3), !dbg !161
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %6, metadata !162, metadata !DIExpression()), !dbg !168
  %11 = bitcast %struct._response_get_ewma_datatype* %6 to i8*, !dbg !169
  call void @llvm.var.annotation(i8* %11, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 219), !dbg !169
  call void @tag_write(%struct._tag* %4, i32 2, i32 2, i32 4), !dbg !170
  %12 = load i32, i32* @_handle_request_get_ewma.inited, align 4, !dbg !171
  %13 = icmp ne i32 %12, 0, !dbg !171
  br i1 %13, label %24, label %14, !dbg !173

14:                                               ; preds = %1
  store i32 1, i32* @_handle_request_get_ewma.inited, align 4, !dbg !174
  store i32 1, i32* @_handle_request_get_ewma.callee_restarted, align 4, !dbg !176
  %15 = call i8* @xdc_pub_socket(), !dbg !177
  store i8* %15, i8** @_handle_request_get_ewma.psocket, align 8, !dbg !178
  %16 = bitcast { i64, i32 }* %7 to i8*, !dbg !179
  %17 = bitcast %struct._tag* %3 to i8*, !dbg !179
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %16, i8* align 1 %17, i64 12, i1 false), !dbg !179
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !179
  %19 = load i64, i64* %18, align 1, !dbg !179
  %20 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !179
  %21 = load i32, i32* %20, align 1, !dbg !179
  %22 = call i8* @xdc_sub_socket(i64 %19, i32 %21), !dbg !179
  store i8* %22, i8** @_handle_request_get_ewma.ssocket, align 8, !dbg !180
  %23 = call i32 @sleep(i32 1), !dbg !181
  br label %24, !dbg !182

24:                                               ; preds = %14, %1
  %25 = load i8*, i8** @_handle_request_get_ewma.ssocket, align 8, !dbg !183
  %26 = bitcast %struct._request_get_ewma_datatype* %5 to i8*, !dbg !184
  call void @xdc_blocking_recv(i8* %25, i8* %26, %struct._tag* %3), !dbg !185
  %27 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %5, i32 0, i32 0, !dbg !186
  %28 = load double, double* %27, align 1, !dbg !186
  %29 = call double @get_ewma(double %28), !dbg !187
  %30 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %6, i32 0, i32 0, !dbg !188
  store double %29, double* %30, align 1, !dbg !189
  call void @llvm.dbg.declare(metadata i32* %8, metadata !190, metadata !DIExpression()), !dbg !191
  %31 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %5, i32 0, i32 1, !dbg !192
  %32 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %31, i32 0, i32 0, !dbg !193
  %33 = load i32, i32* %32, align 1, !dbg !193
  store i32 %33, i32* %8, align 4, !dbg !191
  %34 = load i32, i32* %8, align 4, !dbg !194
  %35 = load i32, i32* @_handle_request_get_ewma.processed_counter, align 4, !dbg !196
  %36 = icmp sgt i32 %34, %35, !dbg !197
  br i1 %36, label %37, label %63, !dbg !198

37:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata i8* %9, metadata !199, metadata !DIExpression()), !dbg !201
  store i8 0, i8* %9, align 1, !dbg !201
  %38 = load i32, i32* %8, align 4, !dbg !202
  store i32 %38, i32* @_handle_request_get_ewma.processed_counter, align 4, !dbg !203
  %39 = load i32, i32* %8, align 4, !dbg !204
  %40 = load i32, i32* @_handle_request_get_ewma.restart_state, align 4, !dbg !206
  %41 = icmp eq i32 %39, %40, !dbg !207
  br i1 %41, label %42, label %43, !dbg !208

42:                                               ; preds = %37
  store i8 1, i8* @caller_restarted_get_ewma, align 1, !dbg !209
  br label %43, !dbg !210

43:                                               ; preds = %42, %37
  %44 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %5, i32 0, i32 0, !dbg !211
  %45 = load double, double* %44, align 1, !dbg !211
  %46 = call double @get_ewma(double %45), !dbg !212
  store double %46, double* @_handle_request_get_ewma.last_processed_result, align 8, !dbg !213
  %47 = load i8, i8* %9, align 1, !dbg !214
  %48 = trunc i8 %47 to i1, !dbg !214
  %49 = zext i1 %48 to i32, !dbg !214
  store i32 %49, i32* @_handle_request_get_ewma.last_processed_error, align 4, !dbg !215
  store i32 -1, i32* @_handle_request_get_ewma.restart_state, align 4, !dbg !216
  store i8 0, i8* @caller_restarted_get_ewma, align 1, !dbg !217
  %50 = load i32, i32* @_handle_request_get_ewma.processed_counter, align 4, !dbg !218
  %51 = shl i32 %50, 2, !dbg !219
  %52 = load i32, i32* @_handle_request_get_ewma.last_processed_error, align 4, !dbg !220
  %53 = shl i32 %52, 1, !dbg !221
  %54 = or i32 %51, %53, !dbg !222
  %55 = load i32, i32* @_handle_request_get_ewma.callee_restarted, align 4, !dbg !223
  %56 = or i32 %54, %55, !dbg !224
  %57 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %6, i32 0, i32 1, !dbg !225
  %58 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %57, i32 0, i32 0, !dbg !226
  store i32 %56, i32* %58, align 1, !dbg !227
  %59 = load double, double* @_handle_request_get_ewma.last_processed_result, align 8, !dbg !228
  %60 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %6, i32 0, i32 0, !dbg !229
  store double %59, double* %60, align 1, !dbg !230
  %61 = load i8*, i8** @_handle_request_get_ewma.psocket, align 8, !dbg !231
  %62 = bitcast %struct._response_get_ewma_datatype* %6 to i8*, !dbg !232
  call void @xdc_asyn_send(i8* %61, i8* %62, %struct._tag* %4), !dbg !233
  br label %102, !dbg !234

63:                                               ; preds = %24
  %64 = load i32, i32* %8, align 4, !dbg !235
  %65 = load i32, i32* @_handle_request_get_ewma.processed_counter, align 4, !dbg !237
  %66 = icmp eq i32 %64, %65, !dbg !238
  br i1 %66, label %67, label %81, !dbg !239

67:                                               ; preds = %63
  %68 = load i32, i32* @_handle_request_get_ewma.processed_counter, align 4, !dbg !240
  %69 = shl i32 %68, 2, !dbg !242
  %70 = load i32, i32* @_handle_request_get_ewma.last_processed_error, align 4, !dbg !243
  %71 = shl i32 %70, 1, !dbg !244
  %72 = or i32 %69, %71, !dbg !245
  %73 = load i32, i32* @_handle_request_get_ewma.callee_restarted, align 4, !dbg !246
  %74 = or i32 %72, %73, !dbg !247
  %75 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %6, i32 0, i32 1, !dbg !248
  %76 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %75, i32 0, i32 0, !dbg !249
  store i32 %74, i32* %76, align 1, !dbg !250
  %77 = load double, double* @_handle_request_get_ewma.last_processed_result, align 8, !dbg !251
  %78 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %6, i32 0, i32 0, !dbg !252
  store double %77, double* %78, align 1, !dbg !253
  %79 = load i8*, i8** @_handle_request_get_ewma.psocket, align 8, !dbg !254
  %80 = bitcast %struct._response_get_ewma_datatype* %6 to i8*, !dbg !255
  call void @xdc_asyn_send(i8* %79, i8* %80, %struct._tag* %4), !dbg !256
  br label %101, !dbg !257

81:                                               ; preds = %63
  %82 = load i32, i32* %8, align 4, !dbg !258
  %83 = icmp eq i32 %82, -2147483648, !dbg !260
  br i1 %83, label %84, label %100, !dbg !261

84:                                               ; preds = %81
  %85 = load i32, i32* @_handle_request_get_ewma.processed_counter, align 4, !dbg !262
  %86 = shl i32 %85, 2, !dbg !264
  %87 = load i32, i32* @_handle_request_get_ewma.last_processed_error, align 4, !dbg !265
  %88 = shl i32 %87, 1, !dbg !266
  %89 = or i32 %86, %88, !dbg !267
  %90 = load i32, i32* @_handle_request_get_ewma.callee_restarted, align 4, !dbg !268
  %91 = or i32 %89, %90, !dbg !269
  %92 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %6, i32 0, i32 1, !dbg !270
  %93 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %92, i32 0, i32 0, !dbg !271
  store i32 %91, i32* %93, align 1, !dbg !272
  %94 = load double, double* @_handle_request_get_ewma.last_processed_result, align 8, !dbg !273
  %95 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %6, i32 0, i32 0, !dbg !274
  store double %94, double* %95, align 1, !dbg !275
  %96 = load i32, i32* @_handle_request_get_ewma.processed_counter, align 4, !dbg !276
  %97 = add nsw i32 %96, 1, !dbg !277
  store i32 %97, i32* @_handle_request_get_ewma.restart_state, align 4, !dbg !278
  %98 = load i8*, i8** @_handle_request_get_ewma.psocket, align 8, !dbg !279
  %99 = bitcast %struct._response_get_ewma_datatype* %6 to i8*, !dbg !280
  call void @xdc_asyn_send(i8* %98, i8* %99, %struct._tag* %4), !dbg !281
  br label %100, !dbg !282

100:                                              ; preds = %84, %81
  br label %101

101:                                              ; preds = %100, %67
  br label %102

102:                                              ; preds = %101, %43
  store i32 0, i32* @_handle_request_get_ewma.callee_restarted, align 4, !dbg !283
  ret void, !dbg !284
}

declare dso_local double @get_ewma(double) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_wrapper_nextrpc(i8* %0) #0 !dbg !285 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !288, metadata !DIExpression()), !dbg !289
  br label %3, !dbg !289

3:                                                ; preds = %1, %3
  %4 = load i8*, i8** %2, align 8, !dbg !290
  %5 = bitcast i8* %4 to %struct._tag*, !dbg !290
  call void @_handle_nextrpc(%struct._tag* %5), !dbg !290
  br label %3, !dbg !289, !llvm.loop !292
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_wrapper_request_get_ewma(i8* %0) #0 !dbg !293 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !294, metadata !DIExpression()), !dbg !295
  br label %3, !dbg !295

3:                                                ; preds = %1, %3
  %4 = load i8*, i8** %2, align 8, !dbg !296
  %5 = bitcast i8* %4 to %struct._tag*, !dbg !296
  call void @_handle_request_get_ewma(%struct._tag* %5), !dbg !296
  br label %3, !dbg !295, !llvm.loop !298
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_slave_rpc_loop() #0 !dbg !299 {
  %1 = alloca %struct._tag, align 1
  %2 = alloca [2 x i64], align 16
  %3 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct._tag* %1, metadata !302, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata [2 x i64]* %2, metadata !304, metadata !DIExpression()), !dbg !311
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0)), !dbg !312
  %4 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 0, !dbg !313
  %5 = bitcast %struct._tag* %1 to i8*, !dbg !314
  %6 = call i32 @pthread_create(i64* %4, %union.pthread_attr_t* null, i8* (i8*)* @_wrapper_nextrpc, i8* %5) #6, !dbg !315
  %7 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 1, !dbg !316
  %8 = bitcast %struct._tag* %1 to i8*, !dbg !317
  %9 = call i32 @pthread_create(i64* %7, %union.pthread_attr_t* null, i8* (i8*)* @_wrapper_request_get_ewma, i8* %8) #6, !dbg !318
  call void @llvm.dbg.declare(metadata i32* %3, metadata !319, metadata !DIExpression()), !dbg !321
  store i32 0, i32* %3, align 4, !dbg !321
  br label %10, !dbg !322

10:                                               ; preds = %19, %0
  %11 = load i32, i32* %3, align 4, !dbg !323
  %12 = icmp slt i32 %11, 2, !dbg !325
  br i1 %12, label %13, label %22, !dbg !326

13:                                               ; preds = %10
  %14 = load i32, i32* %3, align 4, !dbg !327
  %15 = sext i32 %14 to i64, !dbg !328
  %16 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 %15, !dbg !328
  %17 = load i64, i64* %16, align 8, !dbg !328
  %18 = call i32 @pthread_join(i64 %17, i8** null), !dbg !329
  br label %19, !dbg !329

19:                                               ; preds = %13
  %20 = load i32, i32* %3, align 4, !dbg !330
  %21 = add nsw i32 %20, 1, !dbg !330
  store i32 %21, i32* %3, align 4, !dbg !330
  br label %10, !dbg !331, !llvm.loop !332

22:                                               ; preds = %10
  ret i32 0, !dbg !334
}

; Function Attrs: nounwind
declare !callback !335 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #5

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
!3 = !DIFile(filename: "./partitioned/multithreaded/purple/purple_rpc.c", directory: "/workspaces/build/apps/examples/example2")
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
!20 = !DIFile(filename: "partitioned/multithreaded/purple/purple_rpc.c", directory: "/workspaces/build/apps/examples/example2")
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
!33 = distinct !DISubprogram(name: "_handle_request_get_ewma", scope: !3, file: !3, line: 183, type: !4, scopeLine: 183, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
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
!51 = distinct !DIGlobalVariable(name: "caller_restarted_get_ewma", scope: !19, file: !52, line: 55, type: !53, isLocal: false, isDefinition: true)
!52 = !DIFile(filename: "./partitioned/multithreaded/purple/purple_rpc.h", directory: "/workspaces/build/apps/examples/example2")
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
!82 = !DIFile(filename: "./partitioned/multithreaded/autogen/codec.h", directory: "/workspaces/build/apps/examples/example2")
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
!148 = !DILocation(line: 183, column: 41, scope: !33)
!149 = !DILocalVariable(name: "t_tag", scope: !33, file: !3, line: 204, type: !7)
!150 = !DILocation(line: 204, column: 14, scope: !33)
!151 = !DILocalVariable(name: "o_tag", scope: !33, file: !3, line: 205, type: !7)
!152 = !DILocation(line: 205, column: 14, scope: !33)
!153 = !DILocalVariable(name: "req_get_ewma", scope: !33, file: !3, line: 209, type: !154)
!154 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_ewma_datatype", file: !82, line: 61, baseType: !155)
!155 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_ewma_datatype", file: !82, line: 58, size: 192, elements: !156)
!156 = !{!157, !158}
!157 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !155, file: !82, line: 59, baseType: !45, size: 64)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !155, file: !82, line: 60, baseType: !92, size: 128, offset: 64)
!159 = !DILocation(line: 209, column: 31, scope: !33)
!160 = !DILocation(line: 209, column: 5, scope: !33)
!161 = !DILocation(line: 215, column: 5, scope: !33)
!162 = !DILocalVariable(name: "res_get_ewma", scope: !33, file: !3, line: 219, type: !163)
!163 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_ewma_datatype", file: !82, line: 71, baseType: !164)
!164 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_ewma_datatype", file: !82, line: 68, size: 192, elements: !165)
!165 = !{!166, !167}
!166 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !164, file: !82, line: 69, baseType: !45, size: 64)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !164, file: !82, line: 70, baseType: !92, size: 128, offset: 64)
!168 = !DILocation(line: 219, column: 32, scope: !33)
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
!186 = !DILocation(line: 246, column: 46, scope: !33)
!187 = !DILocation(line: 246, column: 24, scope: !33)
!188 = !DILocation(line: 246, column: 18, scope: !33)
!189 = !DILocation(line: 246, column: 22, scope: !33)
!190 = !DILocalVariable(name: "reqId", scope: !33, file: !3, line: 256, type: !34)
!191 = !DILocation(line: 256, column: 9, scope: !33)
!192 = !DILocation(line: 256, column: 30, scope: !33)
!193 = !DILocation(line: 256, column: 38, scope: !33)
!194 = !DILocation(line: 257, column: 8, scope: !195)
!195 = distinct !DILexicalBlock(scope: !33, file: !3, line: 257, column: 8)
!196 = !DILocation(line: 257, column: 16, scope: !195)
!197 = !DILocation(line: 257, column: 14, scope: !195)
!198 = !DILocation(line: 257, column: 8, scope: !33)
!199 = !DILocalVariable(name: "error", scope: !200, file: !3, line: 258, type: !53)
!200 = distinct !DILexicalBlock(scope: !195, file: !3, line: 257, column: 34)
!201 = !DILocation(line: 258, column: 14, scope: !200)
!202 = !DILocation(line: 259, column: 29, scope: !200)
!203 = !DILocation(line: 259, column: 27, scope: !200)
!204 = !DILocation(line: 260, column: 12, scope: !205)
!205 = distinct !DILexicalBlock(scope: !200, file: !3, line: 260, column: 12)
!206 = !DILocation(line: 260, column: 21, scope: !205)
!207 = !DILocation(line: 260, column: 18, scope: !205)
!208 = !DILocation(line: 260, column: 12, scope: !200)
!209 = !DILocation(line: 260, column: 62, scope: !205)
!210 = !DILocation(line: 260, column: 36, scope: !205)
!211 = !DILocation(line: 261, column: 55, scope: !200)
!212 = !DILocation(line: 261, column: 33, scope: !200)
!213 = !DILocation(line: 261, column: 31, scope: !200)
!214 = !DILocation(line: 262, column: 32, scope: !200)
!215 = !DILocation(line: 262, column: 30, scope: !200)
!216 = !DILocation(line: 263, column: 23, scope: !200)
!217 = !DILocation(line: 264, column: 35, scope: !200)
!218 = !DILocation(line: 265, column: 36, scope: !200)
!219 = !DILocation(line: 265, column: 54, scope: !200)
!220 = !DILocation(line: 265, column: 61, scope: !200)
!221 = !DILocation(line: 265, column: 82, scope: !200)
!222 = !DILocation(line: 265, column: 59, scope: !200)
!223 = !DILocation(line: 265, column: 89, scope: !200)
!224 = !DILocation(line: 265, column: 87, scope: !200)
!225 = !DILocation(line: 265, column: 22, scope: !200)
!226 = !DILocation(line: 265, column: 30, scope: !200)
!227 = !DILocation(line: 265, column: 34, scope: !200)
!228 = !DILocation(line: 266, column: 28, scope: !200)
!229 = !DILocation(line: 266, column: 22, scope: !200)
!230 = !DILocation(line: 266, column: 26, scope: !200)
!231 = !DILocation(line: 267, column: 23, scope: !200)
!232 = !DILocation(line: 267, column: 32, scope: !200)
!233 = !DILocation(line: 267, column: 9, scope: !200)
!234 = !DILocation(line: 268, column: 5, scope: !200)
!235 = !DILocation(line: 269, column: 13, scope: !236)
!236 = distinct !DILexicalBlock(scope: !195, file: !3, line: 269, column: 13)
!237 = !DILocation(line: 269, column: 22, scope: !236)
!238 = !DILocation(line: 269, column: 19, scope: !236)
!239 = !DILocation(line: 269, column: 13, scope: !195)
!240 = !DILocation(line: 269, column: 76, scope: !241)
!241 = distinct !DILexicalBlock(scope: !236, file: !3, line: 269, column: 40)
!242 = !DILocation(line: 269, column: 94, scope: !241)
!243 = !DILocation(line: 269, column: 101, scope: !241)
!244 = !DILocation(line: 269, column: 122, scope: !241)
!245 = !DILocation(line: 269, column: 99, scope: !241)
!246 = !DILocation(line: 269, column: 129, scope: !241)
!247 = !DILocation(line: 269, column: 127, scope: !241)
!248 = !DILocation(line: 269, column: 62, scope: !241)
!249 = !DILocation(line: 269, column: 70, scope: !241)
!250 = !DILocation(line: 269, column: 74, scope: !241)
!251 = !DILocation(line: 270, column: 28, scope: !241)
!252 = !DILocation(line: 270, column: 22, scope: !241)
!253 = !DILocation(line: 270, column: 26, scope: !241)
!254 = !DILocation(line: 271, column: 23, scope: !241)
!255 = !DILocation(line: 271, column: 32, scope: !241)
!256 = !DILocation(line: 271, column: 9, scope: !241)
!257 = !DILocation(line: 272, column: 5, scope: !241)
!258 = !DILocation(line: 273, column: 13, scope: !259)
!259 = distinct !DILexicalBlock(scope: !236, file: !3, line: 273, column: 13)
!260 = !DILocation(line: 273, column: 19, scope: !259)
!261 = !DILocation(line: 273, column: 13, scope: !236)
!262 = !DILocation(line: 274, column: 36, scope: !263)
!263 = distinct !DILexicalBlock(scope: !259, file: !3, line: 273, column: 30)
!264 = !DILocation(line: 274, column: 54, scope: !263)
!265 = !DILocation(line: 274, column: 61, scope: !263)
!266 = !DILocation(line: 274, column: 82, scope: !263)
!267 = !DILocation(line: 274, column: 59, scope: !263)
!268 = !DILocation(line: 274, column: 89, scope: !263)
!269 = !DILocation(line: 274, column: 87, scope: !263)
!270 = !DILocation(line: 274, column: 22, scope: !263)
!271 = !DILocation(line: 274, column: 30, scope: !263)
!272 = !DILocation(line: 274, column: 34, scope: !263)
!273 = !DILocation(line: 275, column: 28, scope: !263)
!274 = !DILocation(line: 275, column: 22, scope: !263)
!275 = !DILocation(line: 275, column: 26, scope: !263)
!276 = !DILocation(line: 276, column: 25, scope: !263)
!277 = !DILocation(line: 276, column: 43, scope: !263)
!278 = !DILocation(line: 276, column: 23, scope: !263)
!279 = !DILocation(line: 277, column: 23, scope: !263)
!280 = !DILocation(line: 277, column: 32, scope: !263)
!281 = !DILocation(line: 277, column: 9, scope: !263)
!282 = !DILocation(line: 278, column: 5, scope: !263)
!283 = !DILocation(line: 279, column: 22, scope: !33)
!284 = !DILocation(line: 282, column: 1, scope: !33)
!285 = distinct !DISubprogram(name: "_wrapper_nextrpc", scope: !3, file: !3, line: 285, type: !286, scopeLine: 285, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!286 = !DISubroutineType(types: !287)
!287 = !{!28, !28}
!288 = !DILocalVariable(name: "tag", arg: 1, scope: !285, file: !3, line: 285, type: !28)
!289 = !DILocation(line: 285, column: 1, scope: !285)
!290 = !DILocation(line: 285, column: 1, scope: !291)
!291 = distinct !DILexicalBlock(scope: !285, file: !3, line: 285, column: 1)
!292 = distinct !{!292, !289, !289}
!293 = distinct !DISubprogram(name: "_wrapper_request_get_ewma", scope: !3, file: !3, line: 286, type: !286, scopeLine: 286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!294 = !DILocalVariable(name: "tag", arg: 1, scope: !293, file: !3, line: 286, type: !28)
!295 = !DILocation(line: 286, column: 1, scope: !293)
!296 = !DILocation(line: 286, column: 1, scope: !297)
!297 = distinct !DILexicalBlock(scope: !293, file: !3, line: 286, column: 1)
!298 = distinct !{!298, !295, !295}
!299 = distinct !DISubprogram(name: "_slave_rpc_loop", scope: !3, file: !3, line: 288, type: !300, scopeLine: 288, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!300 = !DISubroutineType(types: !301)
!301 = !{!34}
!302 = !DILocalVariable(name: "n_tag", scope: !299, file: !3, line: 289, type: !7)
!303 = !DILocation(line: 289, column: 14, scope: !299)
!304 = !DILocalVariable(name: "tid", scope: !299, file: !3, line: 290, type: !305)
!305 = !DICompositeType(tag: DW_TAG_array_type, baseType: !306, size: 128, elements: !309)
!306 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !307, line: 27, baseType: !308)
!307 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "")
!308 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!309 = !{!310}
!310 = !DISubrange(count: 2)
!311 = !DILocation(line: 290, column: 15, scope: !299)
!312 = !DILocation(line: 291, column: 5, scope: !299)
!313 = !DILocation(line: 292, column: 21, scope: !299)
!314 = !DILocation(line: 292, column: 53, scope: !299)
!315 = !DILocation(line: 292, column: 5, scope: !299)
!316 = !DILocation(line: 293, column: 21, scope: !299)
!317 = !DILocation(line: 293, column: 62, scope: !299)
!318 = !DILocation(line: 293, column: 5, scope: !299)
!319 = !DILocalVariable(name: "i", scope: !320, file: !3, line: 294, type: !34)
!320 = distinct !DILexicalBlock(scope: !299, file: !3, line: 294, column: 5)
!321 = !DILocation(line: 294, column: 14, scope: !320)
!322 = !DILocation(line: 294, column: 10, scope: !320)
!323 = !DILocation(line: 294, column: 21, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !3, line: 294, column: 5)
!325 = !DILocation(line: 294, column: 23, scope: !324)
!326 = !DILocation(line: 294, column: 5, scope: !320)
!327 = !DILocation(line: 294, column: 55, scope: !324)
!328 = !DILocation(line: 294, column: 51, scope: !324)
!329 = !DILocation(line: 294, column: 38, scope: !324)
!330 = !DILocation(line: 294, column: 34, scope: !324)
!331 = !DILocation(line: 294, column: 5, scope: !324)
!332 = distinct !{!332, !326, !333}
!333 = !DILocation(line: 294, column: 63, scope: !320)
!334 = !DILocation(line: 295, column: 5, scope: !299)
!335 = !{!336}
!336 = !{i64 2, i64 3, i1 false}
