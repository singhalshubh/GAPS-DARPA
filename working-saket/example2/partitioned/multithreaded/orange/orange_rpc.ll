; ModuleID = './partitioned/multithreaded/orange/orange_rpc.c'
source_filename = "./partitioned/multithreaded/orange/orange_rpc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._tag = type { i32, i32, i32 }
%struct._nextrpc_datatype = type { i32, i32, i32, %struct._trailer_datatype }
%struct._trailer_datatype = type { i32, i32, i32, i16, i16 }
%struct._okay_datatype = type { i32, %struct._trailer_datatype }
%struct._request_get_ewma_datatype = type { double, %struct._trailer_datatype }
%struct._response_get_ewma_datatype = type { double, %struct._trailer_datatype }

@_notify_next_tag.inited = internal global i32 0, align 4, !dbg !0
@_notify_next_tag.psocket = internal global i8* null, align 8, !dbg !26
@_notify_next_tag.ssocket = internal global i8* null, align 8, !dbg !29
@.str = private unnamed_addr constant [12 x i8] c"TAG_NEXTRPC\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [48 x i8] c"./partitioned/multithreaded/orange/orange_rpc.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [9 x i8] c"TAG_OKAY\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [21 x i8] c"TAG_REQUEST_GET_EWMA\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [22 x i8] c"TAG_RESPONSE_GET_EWMA\00", section "llvm.metadata"
@_rpc_get_ewma.inited = internal global i32 0, align 4, !dbg !31
@_rpc_get_ewma.psocket = internal global i8* null, align 8, !dbg !39
@_rpc_get_ewma.ssocket = internal global i8* null, align 8, !dbg !41
@_rpc_get_ewma.request_counter = internal global i32 -2147483648, align 4, !dbg !43
@.str.5 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_suborange\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_puborange\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_hal_init(i8* %0, i8* %1) #0 !dbg !49 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !52, metadata !DIExpression()), !dbg !53
  store i8* %1, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !54, metadata !DIExpression()), !dbg !55
  %5 = load i8*, i8** %3, align 8, !dbg !56
  %6 = call i8* @xdc_set_in(i8* %5), !dbg !57
  %7 = load i8*, i8** %4, align 8, !dbg !58
  %8 = call i8* @xdc_set_out(i8* %7), !dbg !59
  call void @xdc_register(void (i8*, i8*, i64*)* @nextrpc_data_encode, void (i8*, i8*, i64*)* @nextrpc_data_decode, i32 1), !dbg !60
  call void @xdc_register(void (i8*, i8*, i64*)* @okay_data_encode, void (i8*, i8*, i64*)* @okay_data_decode, i32 2), !dbg !61
  call void @xdc_register(void (i8*, i8*, i64*)* @request_get_ewma_data_encode, void (i8*, i8*, i64*)* @request_get_ewma_data_decode, i32 3), !dbg !62
  call void @xdc_register(void (i8*, i8*, i64*)* @response_get_ewma_data_encode, void (i8*, i8*, i64*)* @response_get_ewma_data_decode, i32 4), !dbg !63
  ret void, !dbg !64
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
define dso_local void @_notify_next_tag(%struct._tag* %0) #0 !dbg !2 {
  %2 = alloca %struct._tag*, align 8
  %3 = alloca %struct._tag, align 1
  %4 = alloca %struct._tag, align 1
  %5 = alloca %struct._nextrpc_datatype, align 1
  %6 = alloca %struct._okay_datatype, align 1
  %7 = alloca { i64, i32 }, align 1
  store %struct._tag* %0, %struct._tag** %2, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata %struct._nextrpc_datatype* %5, metadata !71, metadata !DIExpression()), !dbg !94
  %8 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !95
  call void @llvm.var.annotation(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 169), !dbg !95
  call void @tag_write(%struct._tag* %3, i32 1, i32 1, i32 1), !dbg !96
  call void @llvm.dbg.declare(metadata %struct._okay_datatype* %6, metadata !97, metadata !DIExpression()), !dbg !103
  %9 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !104
  call void @llvm.var.annotation(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 179), !dbg !104
  call void @tag_write(%struct._tag* %4, i32 2, i32 2, i32 2), !dbg !105
  %10 = load i32, i32* @_notify_next_tag.inited, align 4, !dbg !106
  %11 = icmp ne i32 %10, 0, !dbg !106
  br i1 %11, label %22, label %12, !dbg !108

12:                                               ; preds = %1
  store i32 1, i32* @_notify_next_tag.inited, align 4, !dbg !109
  %13 = call i8* @xdc_pub_socket(), !dbg !111
  store i8* %13, i8** @_notify_next_tag.psocket, align 8, !dbg !112
  %14 = bitcast { i64, i32 }* %7 to i8*, !dbg !113
  %15 = bitcast %struct._tag* %4 to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %14, i8* align 1 %15, i64 12, i1 false), !dbg !113
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !113
  %17 = load i64, i64* %16, align 1, !dbg !113
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !113
  %19 = load i32, i32* %18, align 1, !dbg !113
  %20 = call i8* @xdc_sub_socket_non_blocking(i64 %17, i32 %19, i32 1000), !dbg !113
  store i8* %20, i8** @_notify_next_tag.ssocket, align 8, !dbg !114
  %21 = call i32 @sleep(i32 1), !dbg !115
  br label %22, !dbg !116

22:                                               ; preds = %12, %1
  %23 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !117
  %24 = getelementptr inbounds %struct._tag, %struct._tag* %23, i32 0, i32 0, !dbg !118
  %25 = load i32, i32* %24, align 1, !dbg !118
  %26 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 0, !dbg !119
  store i32 %25, i32* %26, align 1, !dbg !120
  %27 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !121
  %28 = getelementptr inbounds %struct._tag, %struct._tag* %27, i32 0, i32 1, !dbg !122
  %29 = load i32, i32* %28, align 1, !dbg !122
  %30 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 1, !dbg !123
  store i32 %29, i32* %30, align 1, !dbg !124
  %31 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !125
  %32 = getelementptr inbounds %struct._tag, %struct._tag* %31, i32 0, i32 2, !dbg !126
  %33 = load i32, i32* %32, align 1, !dbg !126
  %34 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 2, !dbg !127
  store i32 %33, i32* %34, align 1, !dbg !128
  %35 = load i8*, i8** @_notify_next_tag.psocket, align 8, !dbg !129
  %36 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !130
  call void @xdc_asyn_send(i8* %35, i8* %36, %struct._tag* %3), !dbg !131
  %37 = load i8*, i8** @_notify_next_tag.ssocket, align 8, !dbg !132
  %38 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !133
  call void @xdc_blocking_recv(i8* %37, i8* %38, %struct._tag* %4), !dbg !134
  ret void, !dbg !135
}

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #3

declare dso_local void @tag_write(%struct._tag*, i32, i32, i32) #2

declare dso_local i8* @xdc_pub_socket() #2

declare dso_local i8* @xdc_sub_socket_non_blocking(i64, i32, i32) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local i32 @sleep(i32) #2

declare dso_local void @xdc_asyn_send(i8*, i8*, %struct._tag*) #2

declare dso_local void @xdc_blocking_recv(i8*, i8*, %struct._tag*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_rpc_get_ewma_sync_request_counter(i32* %0, i8* %1, i8* %2, %struct._tag* %3, %struct._tag* %4, double %5) #0 !dbg !136 {
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca %struct._tag*, align 8
  %12 = alloca %struct._tag*, align 8
  %13 = alloca double, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct._request_get_ewma_datatype, align 1
  %16 = alloca %struct._response_get_ewma_datatype, align 1
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32* %0, i32** %8, align 8
  call void @llvm.dbg.declare(metadata i32** %8, metadata !139, metadata !DIExpression()), !dbg !140
  store i8* %1, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !141, metadata !DIExpression()), !dbg !142
  store i8* %2, i8** %10, align 8
  call void @llvm.dbg.declare(metadata i8** %10, metadata !143, metadata !DIExpression()), !dbg !144
  store %struct._tag* %3, %struct._tag** %11, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %11, metadata !145, metadata !DIExpression()), !dbg !146
  store %struct._tag* %4, %struct._tag** %12, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %12, metadata !147, metadata !DIExpression()), !dbg !148
  store double %5, double* %13, align 8
  call void @llvm.dbg.declare(metadata double* %13, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %14, metadata !151, metadata !DIExpression()), !dbg !152
  store i32 30, i32* %14, align 4, !dbg !152
  br label %20, !dbg !153

20:                                               ; preds = %56, %6
  %21 = load i32, i32* %14, align 4, !dbg !154
  %22 = icmp ne i32 %21, 0, !dbg !155
  br i1 %22, label %23, label %57, !dbg !153

23:                                               ; preds = %20
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %15, metadata !156, metadata !DIExpression()), !dbg !163
  %24 = bitcast %struct._request_get_ewma_datatype* %15 to i8*, !dbg !164
  call void @llvm.var.annotation(i8* %24, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 296), !dbg !164
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %16, metadata !165, metadata !DIExpression()), !dbg !171
  %25 = bitcast %struct._response_get_ewma_datatype* %16 to i8*, !dbg !172
  call void @llvm.var.annotation(i8* %25, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 302), !dbg !172
  %26 = load double, double* %13, align 8, !dbg !173
  %27 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %15, i32 0, i32 0, !dbg !174
  store double %26, double* %27, align 1, !dbg !175
  %28 = load i32*, i32** %8, align 8, !dbg !176
  %29 = load i32, i32* %28, align 4, !dbg !177
  %30 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %15, i32 0, i32 1, !dbg !178
  %31 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %30, i32 0, i32 0, !dbg !179
  store i32 %29, i32* %31, align 1, !dbg !180
  %32 = load i8*, i8** %9, align 8, !dbg !181
  %33 = bitcast %struct._request_get_ewma_datatype* %15 to i8*, !dbg !182
  %34 = load %struct._tag*, %struct._tag** %11, align 8, !dbg !183
  call void @xdc_asyn_send(i8* %32, i8* %33, %struct._tag* %34), !dbg !184
  call void @llvm.dbg.declare(metadata i32* %17, metadata !185, metadata !DIExpression()), !dbg !186
  %35 = load i8*, i8** %10, align 8, !dbg !187
  %36 = bitcast %struct._response_get_ewma_datatype* %16 to i8*, !dbg !188
  %37 = load %struct._tag*, %struct._tag** %12, align 8, !dbg !189
  %38 = call i32 @xdc_recv(i8* %35, i8* %36, %struct._tag* %37), !dbg !190
  store i32 %38, i32* %17, align 4, !dbg !186
  call void @llvm.dbg.declare(metadata i32* %18, metadata !191, metadata !DIExpression()), !dbg !192
  %39 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 1, !dbg !193
  %40 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %39, i32 0, i32 0, !dbg !194
  %41 = load i32, i32* %40, align 1, !dbg !194
  %42 = lshr i32 %41, 2, !dbg !195
  store i32 %42, i32* %18, align 4, !dbg !192
  call void @llvm.dbg.declare(metadata i32* %19, metadata !196, metadata !DIExpression()), !dbg !197
  %43 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 1, !dbg !198
  %44 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %43, i32 0, i32 0, !dbg !199
  %45 = load i32, i32* %44, align 1, !dbg !199
  %46 = lshr i32 %45, 1, !dbg !200
  %47 = and i32 %46, 1, !dbg !201
  store i32 %47, i32* %19, align 4, !dbg !197
  %48 = load i32, i32* %17, align 4, !dbg !202
  %49 = icmp eq i32 %48, -1, !dbg !204
  br i1 %49, label %50, label %53, !dbg !205

50:                                               ; preds = %23
  %51 = load i32, i32* %14, align 4, !dbg !206
  %52 = add nsw i32 %51, -1, !dbg !206
  store i32 %52, i32* %14, align 4, !dbg !206
  br label %56, !dbg !208

53:                                               ; preds = %23
  %54 = load i32, i32* %18, align 4, !dbg !209
  %55 = load i32*, i32** %8, align 8, !dbg !211
  store i32 %54, i32* %55, align 4, !dbg !212
  store i32 1, i32* %7, align 4, !dbg !213
  br label %58, !dbg !213

56:                                               ; preds = %50
  br label %20, !dbg !153, !llvm.loop !214

57:                                               ; preds = %20
  store i32 0, i32* %7, align 4, !dbg !216
  br label %58, !dbg !216

58:                                               ; preds = %57, %53
  %59 = load i32, i32* %7, align 4, !dbg !217
  ret i32 %59, !dbg !217
}

declare dso_local i32 @xdc_recv(i8*, i8*, %struct._tag*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_rpc_get_ewma_remote_call(i32 %0, double* %1, i8* %2, i8* %3, %struct._tag* %4, %struct._tag* %5, double %6) #0 !dbg !218 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca %struct._tag*, align 8
  %14 = alloca %struct._tag*, align 8
  %15 = alloca double, align 8
  %16 = alloca i32, align 4
  %17 = alloca %struct._request_get_ewma_datatype, align 1
  %18 = alloca %struct._response_get_ewma_datatype, align 1
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store i32 %0, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !222, metadata !DIExpression()), !dbg !223
  store double* %1, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !224, metadata !DIExpression()), !dbg !225
  store i8* %2, i8** %11, align 8
  call void @llvm.dbg.declare(metadata i8** %11, metadata !226, metadata !DIExpression()), !dbg !227
  store i8* %3, i8** %12, align 8
  call void @llvm.dbg.declare(metadata i8** %12, metadata !228, metadata !DIExpression()), !dbg !229
  store %struct._tag* %4, %struct._tag** %13, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %13, metadata !230, metadata !DIExpression()), !dbg !231
  store %struct._tag* %5, %struct._tag** %14, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %14, metadata !232, metadata !DIExpression()), !dbg !233
  store double %6, double* %15, align 8
  call void @llvm.dbg.declare(metadata double* %15, metadata !234, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.declare(metadata i32* %16, metadata !236, metadata !DIExpression()), !dbg !237
  store i32 30, i32* %16, align 4, !dbg !237
  br label %22, !dbg !238

22:                                               ; preds = %67, %58, %7
  %23 = load i32, i32* %16, align 4, !dbg !239
  %24 = icmp ne i32 %23, 0, !dbg !240
  br i1 %24, label %25, label %68, !dbg !238

25:                                               ; preds = %22
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %17, metadata !241, metadata !DIExpression()), !dbg !243
  %26 = bitcast %struct._request_get_ewma_datatype* %17 to i8*, !dbg !244
  call void @llvm.var.annotation(i8* %26, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 330), !dbg !244
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %18, metadata !245, metadata !DIExpression()), !dbg !246
  %27 = bitcast %struct._response_get_ewma_datatype* %18 to i8*, !dbg !247
  call void @llvm.var.annotation(i8* %27, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 336), !dbg !247
  %28 = load double, double* %15, align 8, !dbg !248
  %29 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %17, i32 0, i32 0, !dbg !249
  store double %28, double* %29, align 1, !dbg !250
  %30 = load i32, i32* %9, align 4, !dbg !251
  %31 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %17, i32 0, i32 1, !dbg !252
  %32 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %31, i32 0, i32 0, !dbg !253
  store i32 %30, i32* %32, align 1, !dbg !254
  %33 = load i8*, i8** %11, align 8, !dbg !255
  %34 = bitcast %struct._request_get_ewma_datatype* %17 to i8*, !dbg !256
  %35 = load %struct._tag*, %struct._tag** %13, align 8, !dbg !257
  call void @xdc_asyn_send(i8* %33, i8* %34, %struct._tag* %35), !dbg !258
  call void @llvm.dbg.declare(metadata i32* %19, metadata !259, metadata !DIExpression()), !dbg !260
  %36 = load i8*, i8** %12, align 8, !dbg !261
  %37 = bitcast %struct._response_get_ewma_datatype* %18 to i8*, !dbg !262
  %38 = load %struct._tag*, %struct._tag** %14, align 8, !dbg !263
  %39 = call i32 @xdc_recv(i8* %36, i8* %37, %struct._tag* %38), !dbg !264
  store i32 %39, i32* %19, align 4, !dbg !260
  call void @llvm.dbg.declare(metadata i32* %20, metadata !265, metadata !DIExpression()), !dbg !266
  %40 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %18, i32 0, i32 1, !dbg !267
  %41 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %40, i32 0, i32 0, !dbg !268
  %42 = load i32, i32* %41, align 1, !dbg !268
  %43 = lshr i32 %42, 2, !dbg !269
  store i32 %43, i32* %20, align 4, !dbg !266
  call void @llvm.dbg.declare(metadata i32* %21, metadata !270, metadata !DIExpression()), !dbg !271
  %44 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %18, i32 0, i32 1, !dbg !272
  %45 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %44, i32 0, i32 0, !dbg !273
  %46 = load i32, i32* %45, align 1, !dbg !273
  %47 = lshr i32 %46, 1, !dbg !274
  %48 = and i32 %47, 1, !dbg !275
  store i32 %48, i32* %21, align 4, !dbg !271
  %49 = load i32, i32* %19, align 4, !dbg !276
  %50 = icmp eq i32 %49, -1, !dbg !278
  br i1 %50, label %51, label %54, !dbg !279

51:                                               ; preds = %25
  %52 = load i32, i32* %16, align 4, !dbg !280
  %53 = add nsw i32 %52, -1, !dbg !280
  store i32 %53, i32* %16, align 4, !dbg !280
  br label %67, !dbg !282

54:                                               ; preds = %25
  %55 = load i32, i32* %20, align 4, !dbg !283
  %56 = load i32, i32* %9, align 4, !dbg !286
  %57 = icmp slt i32 %55, %56, !dbg !287
  br i1 %57, label %58, label %59, !dbg !288

58:                                               ; preds = %54
  br label %22, !dbg !289, !llvm.loop !291

59:                                               ; preds = %54
  %60 = load i32, i32* %21, align 4, !dbg !293
  %61 = icmp ne i32 %60, 0, !dbg !293
  br i1 %61, label %62, label %63, !dbg !295

62:                                               ; preds = %59
  store i32 0, i32* %8, align 4, !dbg !296
  br label %69, !dbg !296

63:                                               ; preds = %59
  %64 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %18, i32 0, i32 0, !dbg !298
  %65 = load double, double* %64, align 1, !dbg !298
  %66 = load double*, double** %10, align 8, !dbg !299
  store double %65, double* %66, align 8, !dbg !300
  store i32 1, i32* %8, align 4, !dbg !301
  br label %69, !dbg !301

67:                                               ; preds = %51
  br label %22, !dbg !238, !llvm.loop !291

68:                                               ; preds = %22
  store i32 0, i32* %8, align 4, !dbg !302
  br label %69, !dbg !302

69:                                               ; preds = %68, %63, %62
  %70 = load i32, i32* %8, align 4, !dbg !303
  ret i32 %70, !dbg !303
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @_rpc_get_ewma(double %0, i32* %1) #0 !dbg !33 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca i32*, align 8
  %6 = alloca %struct._tag, align 1
  %7 = alloca %struct._tag, align 1
  %8 = alloca %struct._request_get_ewma_datatype, align 1
  %9 = alloca %struct._response_get_ewma_datatype, align 1
  %10 = alloca { i64, i32 }, align 1
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  %13 = alloca i32, align 4
  store double %0, double* %4, align 8
  call void @llvm.dbg.declare(metadata double* %4, metadata !304, metadata !DIExpression()), !dbg !305
  store i32* %1, i32** %5, align 8
  call void @llvm.dbg.declare(metadata i32** %5, metadata !306, metadata !DIExpression()), !dbg !307
  call void @llvm.dbg.declare(metadata %struct._tag* %6, metadata !308, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.declare(metadata %struct._tag* %7, metadata !310, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %8, metadata !312, metadata !DIExpression()), !dbg !313
  %14 = bitcast %struct._request_get_ewma_datatype* %8 to i8*, !dbg !314
  call void @llvm.var.annotation(i8* %14, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 388), !dbg !314
  call void @tag_write(%struct._tag* %6, i32 1, i32 1, i32 3), !dbg !315
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %9, metadata !316, metadata !DIExpression()), !dbg !317
  %15 = bitcast %struct._response_get_ewma_datatype* %9 to i8*, !dbg !318
  call void @llvm.var.annotation(i8* %15, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 398), !dbg !318
  call void @tag_write(%struct._tag* %7, i32 2, i32 2, i32 4), !dbg !319
  %16 = load double, double* %4, align 8, !dbg !320
  %17 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %8, i32 0, i32 0, !dbg !321
  store double %16, double* %17, align 1, !dbg !322
  %18 = load i32, i32* @_rpc_get_ewma.inited, align 4, !dbg !323
  %19 = icmp ne i32 %18, 0, !dbg !323
  br i1 %19, label %39, label %20, !dbg !325

20:                                               ; preds = %2
  store i32 1, i32* @_rpc_get_ewma.inited, align 4, !dbg !326
  %21 = call i8* @xdc_pub_socket(), !dbg !328
  store i8* %21, i8** @_rpc_get_ewma.psocket, align 8, !dbg !329
  %22 = bitcast { i64, i32 }* %10 to i8*, !dbg !330
  %23 = bitcast %struct._tag* %7 to i8*, !dbg !330
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %22, i8* align 1 %23, i64 12, i1 false), !dbg !330
  %24 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %10, i32 0, i32 0, !dbg !330
  %25 = load i64, i64* %24, align 1, !dbg !330
  %26 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %10, i32 0, i32 1, !dbg !330
  %27 = load i32, i32* %26, align 1, !dbg !330
  %28 = call i8* @xdc_sub_socket_non_blocking(i64 %25, i32 %27, i32 1000), !dbg !330
  store i8* %28, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !331
  %29 = call i32 @sleep(i32 1), !dbg !332
  call void @llvm.dbg.declare(metadata i32* %11, metadata !333, metadata !DIExpression()), !dbg !334
  %30 = load i8*, i8** @_rpc_get_ewma.psocket, align 8, !dbg !335
  %31 = load i8*, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !336
  %32 = load double, double* %4, align 8, !dbg !337
  %33 = call i32 @_rpc_get_ewma_sync_request_counter(i32* @_rpc_get_ewma.request_counter, i8* %30, i8* %31, %struct._tag* %6, %struct._tag* %7, double %32), !dbg !338
  store i32 %33, i32* %11, align 4, !dbg !334
  %34 = load i32, i32* %11, align 4, !dbg !339
  %35 = icmp eq i32 %34, 0, !dbg !341
  br i1 %35, label %36, label %38, !dbg !342

36:                                               ; preds = %20
  %37 = load i32*, i32** %5, align 8, !dbg !343
  store i32 1, i32* %37, align 4, !dbg !345
  store double 0.000000e+00, double* %3, align 8, !dbg !346
  br label %53, !dbg !346

38:                                               ; preds = %20
  br label %39, !dbg !347

39:                                               ; preds = %38, %2
  %40 = load i32, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !348
  %41 = add nsw i32 %40, 1, !dbg !348
  store i32 %41, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !348
  call void @llvm.dbg.declare(metadata double* %12, metadata !349, metadata !DIExpression()), !dbg !350
  call void @llvm.dbg.declare(metadata i32* %13, metadata !351, metadata !DIExpression()), !dbg !352
  %42 = load i32, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !353
  %43 = load i8*, i8** @_rpc_get_ewma.psocket, align 8, !dbg !354
  %44 = load i8*, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !355
  %45 = load double, double* %4, align 8, !dbg !356
  %46 = call i32 @_rpc_get_ewma_remote_call(i32 %42, double* %12, i8* %43, i8* %44, %struct._tag* %6, %struct._tag* %7, double %45), !dbg !357
  store i32 %46, i32* %13, align 4, !dbg !352
  %47 = load i32, i32* %13, align 4, !dbg !358
  %48 = icmp eq i32 %47, 0, !dbg !360
  br i1 %48, label %49, label %51, !dbg !361

49:                                               ; preds = %39
  %50 = load i32*, i32** %5, align 8, !dbg !362
  store i32 1, i32* %50, align 4, !dbg !364
  store double 0.000000e+00, double* %3, align 8, !dbg !365
  br label %53, !dbg !365

51:                                               ; preds = %39
  %52 = load double, double* %12, align 8, !dbg !366
  store double %52, double* %3, align 8, !dbg !367
  br label %53, !dbg !367

53:                                               ; preds = %51, %49, %36
  %54 = load double, double* %3, align 8, !dbg !368
  ret double %54, !dbg !368
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_master_rpc_init() #0 !dbg !369 {
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0)), !dbg !372
  ret void, !dbg !373
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!45, !46, !47}
!llvm.ident = !{!48}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "inited", scope: !2, file: !3, line: 161, type: !38, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "_notify_next_tag", scope: !3, file: !3, line: 148, type: !4, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!3 = !DIFile(filename: "./partitioned/multithreaded/orange/orange_rpc.c", directory: "/workspaces/build/apps/examples/example2")
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
!20 = !DIFile(filename: "partitioned/multithreaded/orange/orange_rpc.c", directory: "/workspaces/build/apps/examples/example2")
!21 = !{}
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!0, !26, !29, !31, !39, !41, !43}
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "psocket", scope: !2, file: !3, line: 162, type: !28, isLocal: true, isDefinition: true)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "ssocket", scope: !2, file: !3, line: 163, type: !28, isLocal: true, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "inited", scope: !33, file: !3, line: 379, type: !38, isLocal: true, isDefinition: true)
!33 = distinct !DISubprogram(name: "_rpc_get_ewma", scope: !3, file: !3, line: 365, type: !34, scopeLine: 365, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!34 = !DISubroutineType(types: !35)
!35 = !{!36, !36, !37}
!36 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "psocket", scope: !33, file: !3, line: 380, type: !28, isLocal: true, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "ssocket", scope: !33, file: !3, line: 381, type: !28, isLocal: true, isDefinition: true)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(name: "request_counter", scope: !33, file: !3, line: 382, type: !38, isLocal: true, isDefinition: true)
!45 = !{i32 7, !"Dwarf Version", i32 4}
!46 = !{i32 2, !"Debug Info Version", i32 3}
!47 = !{i32 1, !"wchar_size", i32 4}
!48 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!49 = distinct !DISubprogram(name: "_hal_init", scope: !3, file: !3, line: 137, type: !50, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!50 = !DISubroutineType(types: !51)
!51 = !{null, !23, !23}
!52 = !DILocalVariable(name: "inuri", arg: 1, scope: !49, file: !3, line: 137, type: !23)
!53 = !DILocation(line: 137, column: 22, scope: !49)
!54 = !DILocalVariable(name: "outuri", arg: 2, scope: !49, file: !3, line: 137, type: !23)
!55 = !DILocation(line: 137, column: 35, scope: !49)
!56 = !DILocation(line: 139, column: 16, scope: !49)
!57 = !DILocation(line: 139, column: 5, scope: !49)
!58 = !DILocation(line: 140, column: 17, scope: !49)
!59 = !DILocation(line: 140, column: 5, scope: !49)
!60 = !DILocation(line: 141, column: 5, scope: !49)
!61 = !DILocation(line: 142, column: 5, scope: !49)
!62 = !DILocation(line: 143, column: 5, scope: !49)
!63 = !DILocation(line: 144, column: 5, scope: !49)
!64 = !DILocation(line: 146, column: 1, scope: !49)
!65 = !DILocalVariable(name: "n_tag", arg: 1, scope: !2, file: !3, line: 148, type: !6)
!66 = !DILocation(line: 148, column: 33, scope: !2)
!67 = !DILocalVariable(name: "t_tag", scope: !2, file: !3, line: 164, type: !7)
!68 = !DILocation(line: 164, column: 14, scope: !2)
!69 = !DILocalVariable(name: "o_tag", scope: !2, file: !3, line: 165, type: !7)
!70 = !DILocation(line: 165, column: 14, scope: !2)
!71 = !DILocalVariable(name: "nxt", scope: !2, file: !3, line: 169, type: !72)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "nextrpc_datatype", file: !73, line: 39, baseType: !74)
!73 = !DIFile(filename: "./partitioned/multithreaded/autogen/codec.h", directory: "/workspaces/build/apps/examples/example2")
!74 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_nextrpc_datatype", file: !73, line: 34, size: 224, elements: !75)
!75 = !{!76, !80, !81, !82}
!76 = !DIDerivedType(tag: DW_TAG_member, name: "mux", scope: !74, file: !73, line: 35, baseType: !77, size: 32)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !78, line: 26, baseType: !79)
!78 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !15, line: 41, baseType: !38)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "sec", scope: !74, file: !73, line: 36, baseType: !77, size: 32, offset: 32)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "typ", scope: !74, file: !73, line: 37, baseType: !77, size: 32, offset: 64)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !74, file: !73, line: 38, baseType: !83, size: 128, offset: 96)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "trailer_datatype", file: !73, line: 24, baseType: !84)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_trailer_datatype", file: !73, line: 18, size: 128, elements: !85)
!85 = !{!86, !87, !88, !89, !93}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !84, file: !73, line: 19, baseType: !12, size: 32)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "rqr", scope: !84, file: !73, line: 20, baseType: !12, size: 32, offset: 32)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "oid", scope: !84, file: !73, line: 21, baseType: !12, size: 32, offset: 64)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "mid", scope: !84, file: !73, line: 22, baseType: !90, size: 16, offset: 96)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !13, line: 25, baseType: !91)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !15, line: 40, baseType: !92)
!92 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "crc", scope: !84, file: !73, line: 23, baseType: !90, size: 16, offset: 112)
!94 = !DILocation(line: 169, column: 22, scope: !2)
!95 = !DILocation(line: 169, column: 5, scope: !2)
!96 = !DILocation(line: 175, column: 5, scope: !2)
!97 = !DILocalVariable(name: "okay", scope: !2, file: !3, line: 179, type: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "okay_datatype", file: !73, line: 51, baseType: !99)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_okay_datatype", file: !73, line: 48, size: 160, elements: !100)
!100 = !{!101, !102}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !99, file: !73, line: 49, baseType: !77, size: 32)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !99, file: !73, line: 50, baseType: !83, size: 128, offset: 32)
!103 = !DILocation(line: 179, column: 19, scope: !2)
!104 = !DILocation(line: 179, column: 5, scope: !2)
!105 = !DILocation(line: 185, column: 5, scope: !2)
!106 = !DILocation(line: 193, column: 10, scope: !107)
!107 = distinct !DILexicalBlock(scope: !2, file: !3, line: 193, column: 9)
!108 = !DILocation(line: 193, column: 9, scope: !2)
!109 = !DILocation(line: 194, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !3, line: 193, column: 18)
!111 = !DILocation(line: 195, column: 19, scope: !110)
!112 = !DILocation(line: 195, column: 17, scope: !110)
!113 = !DILocation(line: 196, column: 19, scope: !110)
!114 = !DILocation(line: 196, column: 17, scope: !110)
!115 = !DILocation(line: 197, column: 9, scope: !110)
!116 = !DILocation(line: 198, column: 5, scope: !110)
!117 = !DILocation(line: 200, column: 15, scope: !2)
!118 = !DILocation(line: 200, column: 22, scope: !2)
!119 = !DILocation(line: 200, column: 9, scope: !2)
!120 = !DILocation(line: 200, column: 13, scope: !2)
!121 = !DILocation(line: 201, column: 15, scope: !2)
!122 = !DILocation(line: 201, column: 22, scope: !2)
!123 = !DILocation(line: 201, column: 9, scope: !2)
!124 = !DILocation(line: 201, column: 13, scope: !2)
!125 = !DILocation(line: 202, column: 15, scope: !2)
!126 = !DILocation(line: 202, column: 22, scope: !2)
!127 = !DILocation(line: 202, column: 9, scope: !2)
!128 = !DILocation(line: 202, column: 13, scope: !2)
!129 = !DILocation(line: 210, column: 19, scope: !2)
!130 = !DILocation(line: 210, column: 28, scope: !2)
!131 = !DILocation(line: 210, column: 5, scope: !2)
!132 = !DILocation(line: 211, column: 23, scope: !2)
!133 = !DILocation(line: 211, column: 32, scope: !2)
!134 = !DILocation(line: 211, column: 5, scope: !2)
!135 = !DILocation(line: 214, column: 1, scope: !2)
!136 = distinct !DISubprogram(name: "_rpc_get_ewma_sync_request_counter", scope: !3, file: !3, line: 291, type: !137, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!137 = !DISubroutineType(types: !138)
!138 = !{!38, !37, !28, !28, !6, !6, !36}
!139 = !DILocalVariable(name: "request_counter", arg: 1, scope: !136, file: !3, line: 291, type: !37)
!140 = !DILocation(line: 291, column: 45, scope: !136)
!141 = !DILocalVariable(name: "psocket", arg: 2, scope: !136, file: !3, line: 291, type: !28)
!142 = !DILocation(line: 291, column: 68, scope: !136)
!143 = !DILocalVariable(name: "ssocket", arg: 3, scope: !136, file: !3, line: 291, type: !28)
!144 = !DILocation(line: 291, column: 83, scope: !136)
!145 = !DILocalVariable(name: "t_tag", arg: 4, scope: !136, file: !3, line: 291, type: !6)
!146 = !DILocation(line: 291, column: 102, scope: !136)
!147 = !DILocalVariable(name: "o_tag", arg: 5, scope: !136, file: !3, line: 291, type: !6)
!148 = !DILocation(line: 291, column: 119, scope: !136)
!149 = !DILocalVariable(name: "x", arg: 6, scope: !136, file: !3, line: 291, type: !36)
!150 = !DILocation(line: 291, column: 132, scope: !136)
!151 = !DILocalVariable(name: "tries_remaining", scope: !136, file: !3, line: 292, type: !38)
!152 = !DILocation(line: 292, column: 9, scope: !136)
!153 = !DILocation(line: 293, column: 5, scope: !136)
!154 = !DILocation(line: 293, column: 11, scope: !136)
!155 = !DILocation(line: 293, column: 27, scope: !136)
!156 = !DILocalVariable(name: "req_get_ewma", scope: !157, file: !3, line: 296, type: !158)
!157 = distinct !DILexicalBlock(scope: !136, file: !3, line: 293, column: 32)
!158 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_ewma_datatype", file: !73, line: 61, baseType: !159)
!159 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_ewma_datatype", file: !73, line: 58, size: 192, elements: !160)
!160 = !{!161, !162}
!161 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !159, file: !73, line: 59, baseType: !36, size: 64)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !159, file: !73, line: 60, baseType: !83, size: 128, offset: 64)
!163 = !DILocation(line: 296, column: 35, scope: !157)
!164 = !DILocation(line: 296, column: 9, scope: !157)
!165 = !DILocalVariable(name: "res_get_ewma", scope: !157, file: !3, line: 302, type: !166)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_ewma_datatype", file: !73, line: 71, baseType: !167)
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_ewma_datatype", file: !73, line: 68, size: 192, elements: !168)
!168 = !{!169, !170}
!169 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !167, file: !73, line: 69, baseType: !36, size: 64)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !167, file: !73, line: 70, baseType: !83, size: 128, offset: 64)
!171 = !DILocation(line: 302, column: 36, scope: !157)
!172 = !DILocation(line: 302, column: 9, scope: !157)
!173 = !DILocation(line: 306, column: 26, scope: !157)
!174 = !DILocation(line: 306, column: 22, scope: !157)
!175 = !DILocation(line: 306, column: 24, scope: !157)
!176 = !DILocation(line: 307, column: 37, scope: !157)
!177 = !DILocation(line: 307, column: 36, scope: !157)
!178 = !DILocation(line: 307, column: 22, scope: !157)
!179 = !DILocation(line: 307, column: 30, scope: !157)
!180 = !DILocation(line: 307, column: 34, scope: !157)
!181 = !DILocation(line: 308, column: 23, scope: !157)
!182 = !DILocation(line: 308, column: 32, scope: !157)
!183 = !DILocation(line: 308, column: 47, scope: !157)
!184 = !DILocation(line: 308, column: 9, scope: !157)
!185 = !DILocalVariable(name: "status", scope: !157, file: !3, line: 310, type: !38)
!186 = !DILocation(line: 310, column: 13, scope: !157)
!187 = !DILocation(line: 310, column: 31, scope: !157)
!188 = !DILocation(line: 310, column: 40, scope: !157)
!189 = !DILocation(line: 310, column: 55, scope: !157)
!190 = !DILocation(line: 310, column: 22, scope: !157)
!191 = !DILocalVariable(name: "respId", scope: !157, file: !3, line: 312, type: !38)
!192 = !DILocation(line: 312, column: 13, scope: !157)
!193 = !DILocation(line: 312, column: 35, scope: !157)
!194 = !DILocation(line: 312, column: 43, scope: !157)
!195 = !DILocation(line: 312, column: 47, scope: !157)
!196 = !DILocalVariable(name: "error", scope: !157, file: !3, line: 313, type: !38)
!197 = !DILocation(line: 313, column: 13, scope: !157)
!198 = !DILocation(line: 313, column: 35, scope: !157)
!199 = !DILocation(line: 313, column: 43, scope: !157)
!200 = !DILocation(line: 313, column: 47, scope: !157)
!201 = !DILocation(line: 313, column: 52, scope: !157)
!202 = !DILocation(line: 314, column: 12, scope: !203)
!203 = distinct !DILexicalBlock(scope: !157, file: !3, line: 314, column: 12)
!204 = !DILocation(line: 314, column: 19, scope: !203)
!205 = !DILocation(line: 314, column: 12, scope: !157)
!206 = !DILocation(line: 315, column: 28, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !3, line: 314, column: 25)
!208 = !DILocation(line: 316, column: 9, scope: !207)
!209 = !DILocation(line: 318, column: 32, scope: !210)
!210 = distinct !DILexicalBlock(scope: !203, file: !3, line: 317, column: 13)
!211 = !DILocation(line: 318, column: 14, scope: !210)
!212 = !DILocation(line: 318, column: 30, scope: !210)
!213 = !DILocation(line: 319, column: 13, scope: !210)
!214 = distinct !{!214, !153, !215}
!215 = !DILocation(line: 321, column: 5, scope: !136)
!216 = !DILocation(line: 322, column: 5, scope: !136)
!217 = !DILocation(line: 323, column: 1, scope: !136)
!218 = distinct !DISubprogram(name: "_rpc_get_ewma_remote_call", scope: !3, file: !3, line: 325, type: !219, scopeLine: 325, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!219 = !DISubroutineType(types: !220)
!220 = !{!38, !38, !221, !28, !28, !6, !6, !36}
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!222 = !DILocalVariable(name: "reqId", arg: 1, scope: !218, file: !3, line: 325, type: !38)
!223 = !DILocation(line: 325, column: 35, scope: !218)
!224 = !DILocalVariable(name: "result", arg: 2, scope: !218, file: !3, line: 325, type: !221)
!225 = !DILocation(line: 325, column: 50, scope: !218)
!226 = !DILocalVariable(name: "psocket", arg: 3, scope: !218, file: !3, line: 325, type: !28)
!227 = !DILocation(line: 325, column: 64, scope: !218)
!228 = !DILocalVariable(name: "ssocket", arg: 4, scope: !218, file: !3, line: 325, type: !28)
!229 = !DILocation(line: 325, column: 79, scope: !218)
!230 = !DILocalVariable(name: "t_tag", arg: 5, scope: !218, file: !3, line: 325, type: !6)
!231 = !DILocation(line: 325, column: 98, scope: !218)
!232 = !DILocalVariable(name: "o_tag", arg: 6, scope: !218, file: !3, line: 325, type: !6)
!233 = !DILocation(line: 325, column: 115, scope: !218)
!234 = !DILocalVariable(name: "x", arg: 7, scope: !218, file: !3, line: 325, type: !36)
!235 = !DILocation(line: 325, column: 128, scope: !218)
!236 = !DILocalVariable(name: "tries_remaining", scope: !218, file: !3, line: 326, type: !38)
!237 = !DILocation(line: 326, column: 9, scope: !218)
!238 = !DILocation(line: 327, column: 5, scope: !218)
!239 = !DILocation(line: 327, column: 11, scope: !218)
!240 = !DILocation(line: 327, column: 26, scope: !218)
!241 = !DILocalVariable(name: "req_get_ewma", scope: !242, file: !3, line: 330, type: !158)
!242 = distinct !DILexicalBlock(scope: !218, file: !3, line: 327, column: 30)
!243 = !DILocation(line: 330, column: 35, scope: !242)
!244 = !DILocation(line: 330, column: 9, scope: !242)
!245 = !DILocalVariable(name: "res_get_ewma", scope: !242, file: !3, line: 336, type: !166)
!246 = !DILocation(line: 336, column: 36, scope: !242)
!247 = !DILocation(line: 336, column: 9, scope: !242)
!248 = !DILocation(line: 340, column: 26, scope: !242)
!249 = !DILocation(line: 340, column: 22, scope: !242)
!250 = !DILocation(line: 340, column: 24, scope: !242)
!251 = !DILocation(line: 341, column: 36, scope: !242)
!252 = !DILocation(line: 341, column: 22, scope: !242)
!253 = !DILocation(line: 341, column: 30, scope: !242)
!254 = !DILocation(line: 341, column: 34, scope: !242)
!255 = !DILocation(line: 342, column: 23, scope: !242)
!256 = !DILocation(line: 342, column: 32, scope: !242)
!257 = !DILocation(line: 342, column: 47, scope: !242)
!258 = !DILocation(line: 342, column: 9, scope: !242)
!259 = !DILocalVariable(name: "status", scope: !242, file: !3, line: 344, type: !38)
!260 = !DILocation(line: 344, column: 13, scope: !242)
!261 = !DILocation(line: 344, column: 31, scope: !242)
!262 = !DILocation(line: 344, column: 40, scope: !242)
!263 = !DILocation(line: 344, column: 55, scope: !242)
!264 = !DILocation(line: 344, column: 22, scope: !242)
!265 = !DILocalVariable(name: "respId", scope: !242, file: !3, line: 346, type: !38)
!266 = !DILocation(line: 346, column: 13, scope: !242)
!267 = !DILocation(line: 346, column: 35, scope: !242)
!268 = !DILocation(line: 346, column: 43, scope: !242)
!269 = !DILocation(line: 346, column: 47, scope: !242)
!270 = !DILocalVariable(name: "error", scope: !242, file: !3, line: 347, type: !38)
!271 = !DILocation(line: 347, column: 13, scope: !242)
!272 = !DILocation(line: 347, column: 35, scope: !242)
!273 = !DILocation(line: 347, column: 43, scope: !242)
!274 = !DILocation(line: 347, column: 47, scope: !242)
!275 = !DILocation(line: 347, column: 52, scope: !242)
!276 = !DILocation(line: 348, column: 12, scope: !277)
!277 = distinct !DILexicalBlock(scope: !242, file: !3, line: 348, column: 12)
!278 = !DILocation(line: 348, column: 19, scope: !277)
!279 = !DILocation(line: 348, column: 12, scope: !242)
!280 = !DILocation(line: 349, column: 28, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !3, line: 348, column: 25)
!282 = !DILocation(line: 350, column: 9, scope: !281)
!283 = !DILocation(line: 352, column: 16, scope: !284)
!284 = distinct !DILexicalBlock(scope: !285, file: !3, line: 352, column: 16)
!285 = distinct !DILexicalBlock(scope: !277, file: !3, line: 351, column: 13)
!286 = !DILocation(line: 352, column: 25, scope: !284)
!287 = !DILocation(line: 352, column: 23, scope: !284)
!288 = !DILocation(line: 352, column: 16, scope: !285)
!289 = !DILocation(line: 353, column: 17, scope: !290)
!290 = distinct !DILexicalBlock(scope: !284, file: !3, line: 352, column: 31)
!291 = distinct !{!291, !238, !292}
!292 = !DILocation(line: 361, column: 5, scope: !218)
!293 = !DILocation(line: 355, column: 16, scope: !294)
!294 = distinct !DILexicalBlock(scope: !285, file: !3, line: 355, column: 16)
!295 = !DILocation(line: 355, column: 16, scope: !285)
!296 = !DILocation(line: 356, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !294, file: !3, line: 355, column: 22)
!298 = !DILocation(line: 358, column: 36, scope: !285)
!299 = !DILocation(line: 358, column: 14, scope: !285)
!300 = !DILocation(line: 358, column: 21, scope: !285)
!301 = !DILocation(line: 359, column: 13, scope: !285)
!302 = !DILocation(line: 362, column: 5, scope: !218)
!303 = !DILocation(line: 363, column: 1, scope: !218)
!304 = !DILocalVariable(name: "x", arg: 1, scope: !33, file: !3, line: 365, type: !36)
!305 = !DILocation(line: 365, column: 29, scope: !33)
!306 = !DILocalVariable(name: "error", arg: 2, scope: !33, file: !3, line: 365, type: !37)
!307 = !DILocation(line: 365, column: 37, scope: !33)
!308 = !DILocalVariable(name: "t_tag", scope: !33, file: !3, line: 383, type: !7)
!309 = !DILocation(line: 383, column: 14, scope: !33)
!310 = !DILocalVariable(name: "o_tag", scope: !33, file: !3, line: 384, type: !7)
!311 = !DILocation(line: 384, column: 14, scope: !33)
!312 = !DILocalVariable(name: "req_get_ewma", scope: !33, file: !3, line: 388, type: !158)
!313 = !DILocation(line: 388, column: 31, scope: !33)
!314 = !DILocation(line: 388, column: 5, scope: !33)
!315 = !DILocation(line: 394, column: 5, scope: !33)
!316 = !DILocalVariable(name: "res_get_ewma", scope: !33, file: !3, line: 398, type: !166)
!317 = !DILocation(line: 398, column: 32, scope: !33)
!318 = !DILocation(line: 398, column: 5, scope: !33)
!319 = !DILocation(line: 404, column: 5, scope: !33)
!320 = !DILocation(line: 406, column: 22, scope: !33)
!321 = !DILocation(line: 406, column: 18, scope: !33)
!322 = !DILocation(line: 406, column: 20, scope: !33)
!323 = !DILocation(line: 419, column: 10, scope: !324)
!324 = distinct !DILexicalBlock(scope: !33, file: !3, line: 419, column: 9)
!325 = !DILocation(line: 419, column: 9, scope: !33)
!326 = !DILocation(line: 420, column: 16, scope: !327)
!327 = distinct !DILexicalBlock(scope: !324, file: !3, line: 419, column: 18)
!328 = !DILocation(line: 421, column: 19, scope: !327)
!329 = !DILocation(line: 421, column: 17, scope: !327)
!330 = !DILocation(line: 422, column: 19, scope: !327)
!331 = !DILocation(line: 422, column: 17, scope: !327)
!332 = !DILocation(line: 423, column: 9, scope: !327)
!333 = !DILocalVariable(name: "status", scope: !327, file: !3, line: 424, type: !38)
!334 = !DILocation(line: 424, column: 13, scope: !327)
!335 = !DILocation(line: 424, column: 75, scope: !327)
!336 = !DILocation(line: 424, column: 84, scope: !327)
!337 = !DILocation(line: 424, column: 108, scope: !327)
!338 = !DILocation(line: 424, column: 22, scope: !327)
!339 = !DILocation(line: 425, column: 12, scope: !340)
!340 = distinct !DILexicalBlock(scope: !327, file: !3, line: 425, column: 12)
!341 = !DILocation(line: 425, column: 19, scope: !340)
!342 = !DILocation(line: 425, column: 12, scope: !327)
!343 = !DILocation(line: 426, column: 14, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !3, line: 425, column: 24)
!345 = !DILocation(line: 426, column: 20, scope: !344)
!346 = !DILocation(line: 427, column: 13, scope: !344)
!347 = !DILocation(line: 429, column: 5, scope: !327)
!348 = !DILocation(line: 430, column: 20, scope: !33)
!349 = !DILocalVariable(name: "result", scope: !33, file: !3, line: 443, type: !36)
!350 = !DILocation(line: 443, column: 12, scope: !33)
!351 = !DILocalVariable(name: "status1", scope: !33, file: !3, line: 444, type: !38)
!352 = !DILocation(line: 444, column: 9, scope: !33)
!353 = !DILocation(line: 444, column: 45, scope: !33)
!354 = !DILocation(line: 444, column: 72, scope: !33)
!355 = !DILocation(line: 444, column: 81, scope: !33)
!356 = !DILocation(line: 444, column: 105, scope: !33)
!357 = !DILocation(line: 444, column: 19, scope: !33)
!358 = !DILocation(line: 445, column: 8, scope: !359)
!359 = distinct !DILexicalBlock(scope: !33, file: !3, line: 445, column: 8)
!360 = !DILocation(line: 445, column: 16, scope: !359)
!361 = !DILocation(line: 445, column: 8, scope: !33)
!362 = !DILocation(line: 446, column: 10, scope: !363)
!363 = distinct !DILexicalBlock(scope: !359, file: !3, line: 445, column: 21)
!364 = !DILocation(line: 446, column: 16, scope: !363)
!365 = !DILocation(line: 447, column: 9, scope: !363)
!366 = !DILocation(line: 451, column: 13, scope: !33)
!367 = !DILocation(line: 451, column: 5, scope: !33)
!368 = !DILocation(line: 455, column: 1, scope: !33)
!369 = distinct !DISubprogram(name: "_master_rpc_init", scope: !3, file: !3, line: 457, type: !370, scopeLine: 457, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!370 = !DISubroutineType(types: !371)
!371 = !{null}
!372 = !DILocation(line: 458, column: 5, scope: !369)
!373 = !DILocation(line: 459, column: 1, scope: !369)
