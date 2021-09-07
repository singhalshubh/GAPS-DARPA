; ModuleID = './partitioned/multithreaded/purple/purple_rpc.c'
source_filename = "./partitioned/multithreaded/purple/purple_rpc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._tag = type { i32, i32, i32 }
%struct._nextrpc_datatype = type { i32, i32, i32, %struct._trailer_datatype }
%struct._trailer_datatype = type { i32, i32, i32, i16, i16 }
%struct._okay_datatype = type { i32, %struct._trailer_datatype }
%struct._request_get_ewma_datatype = type { i32, %struct._trailer_datatype }
%struct._response_get_ewma_datatype = type { double, %struct._trailer_datatype }

@_notify_next_tag.inited = internal global i32 0, align 4, !dbg !0
@_notify_next_tag.psocket = internal global i8* null, align 8, !dbg !26
@_notify_next_tag.ssocket = internal global i8* null, align 8, !dbg !29
@.str = private unnamed_addr constant [12 x i8] c"TAG_NEXTRPC\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [48 x i8] c"./partitioned/multithreaded/purple/purple_rpc.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [9 x i8] c"TAG_OKAY\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [21 x i8] c"TAG_REQUEST_GET_EWMA\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [22 x i8] c"TAG_RESPONSE_GET_EWMA\00", section "llvm.metadata"
@_rpc_get_ewma.inited = internal global i32 0, align 4, !dbg !31
@_rpc_get_ewma.psocket = internal global i8* null, align 8, !dbg !39
@_rpc_get_ewma.ssocket = internal global i8* null, align 8, !dbg !41
@_rpc_get_ewma.request_counter = internal global i32 -2147483648, align 4, !dbg !43
@.str.5 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_subpurple\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_pubpurple\00", align 1

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
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 1), !dbg !96
  call void @llvm.dbg.declare(metadata %struct._okay_datatype* %6, metadata !97, metadata !DIExpression()), !dbg !103
  %9 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !104
  call void @llvm.var.annotation(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 179), !dbg !104
  call void @tag_write(%struct._tag* %4, i32 1, i32 1, i32 2), !dbg !105
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
define dso_local i32 @_rpc_get_ewma_sync_request_counter(i32* %0, i8* %1, i8* %2, %struct._tag* %3, %struct._tag* %4) #0 !dbg !136 {
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca %struct._tag*, align 8
  %11 = alloca %struct._tag*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct._request_get_ewma_datatype, align 1
  %14 = alloca %struct._response_get_ewma_datatype, align 1
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32* %0, i32** %7, align 8
  call void @llvm.dbg.declare(metadata i32** %7, metadata !139, metadata !DIExpression()), !dbg !140
  store i8* %1, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !141, metadata !DIExpression()), !dbg !142
  store i8* %2, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !143, metadata !DIExpression()), !dbg !144
  store %struct._tag* %3, %struct._tag** %10, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %10, metadata !145, metadata !DIExpression()), !dbg !146
  store %struct._tag* %4, %struct._tag** %11, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %11, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %12, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 15, i32* %12, align 4, !dbg !150
  br label %18, !dbg !151

18:                                               ; preds = %53, %5
  %19 = load i32, i32* %12, align 4, !dbg !152
  %20 = icmp ne i32 %19, 0, !dbg !153
  br i1 %20, label %21, label %54, !dbg !151

21:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %13, metadata !154, metadata !DIExpression()), !dbg !161
  %22 = bitcast %struct._request_get_ewma_datatype* %13 to i8*, !dbg !162
  call void @llvm.var.annotation(i8* %22, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 296), !dbg !162
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %14, metadata !163, metadata !DIExpression()), !dbg !169
  %23 = bitcast %struct._response_get_ewma_datatype* %14 to i8*, !dbg !170
  call void @llvm.var.annotation(i8* %23, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 302), !dbg !170
  %24 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %13, i32 0, i32 0, !dbg !171
  store i32 0, i32* %24, align 1, !dbg !172
  %25 = load i32*, i32** %7, align 8, !dbg !173
  %26 = load i32, i32* %25, align 4, !dbg !174
  %27 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %13, i32 0, i32 1, !dbg !175
  %28 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %27, i32 0, i32 0, !dbg !176
  store i32 %26, i32* %28, align 1, !dbg !177
  %29 = load i8*, i8** %8, align 8, !dbg !178
  %30 = bitcast %struct._request_get_ewma_datatype* %13 to i8*, !dbg !179
  %31 = load %struct._tag*, %struct._tag** %10, align 8, !dbg !180
  call void @xdc_asyn_send(i8* %29, i8* %30, %struct._tag* %31), !dbg !181
  call void @llvm.dbg.declare(metadata i32* %15, metadata !182, metadata !DIExpression()), !dbg !183
  %32 = load i8*, i8** %9, align 8, !dbg !184
  %33 = bitcast %struct._response_get_ewma_datatype* %14 to i8*, !dbg !185
  %34 = load %struct._tag*, %struct._tag** %11, align 8, !dbg !186
  %35 = call i32 @xdc_recv(i8* %32, i8* %33, %struct._tag* %34), !dbg !187
  store i32 %35, i32* %15, align 4, !dbg !183
  call void @llvm.dbg.declare(metadata i32* %16, metadata !188, metadata !DIExpression()), !dbg !189
  %36 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %14, i32 0, i32 1, !dbg !190
  %37 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %36, i32 0, i32 0, !dbg !191
  %38 = load i32, i32* %37, align 1, !dbg !191
  %39 = lshr i32 %38, 2, !dbg !192
  store i32 %39, i32* %16, align 4, !dbg !189
  call void @llvm.dbg.declare(metadata i32* %17, metadata !193, metadata !DIExpression()), !dbg !194
  %40 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %14, i32 0, i32 1, !dbg !195
  %41 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %40, i32 0, i32 0, !dbg !196
  %42 = load i32, i32* %41, align 1, !dbg !196
  %43 = lshr i32 %42, 1, !dbg !197
  %44 = and i32 %43, 1, !dbg !198
  store i32 %44, i32* %17, align 4, !dbg !194
  %45 = load i32, i32* %15, align 4, !dbg !199
  %46 = icmp eq i32 %45, -1, !dbg !201
  br i1 %46, label %47, label %50, !dbg !202

47:                                               ; preds = %21
  %48 = load i32, i32* %12, align 4, !dbg !203
  %49 = add nsw i32 %48, -1, !dbg !203
  store i32 %49, i32* %12, align 4, !dbg !203
  br label %53, !dbg !205

50:                                               ; preds = %21
  %51 = load i32, i32* %16, align 4, !dbg !206
  %52 = load i32*, i32** %7, align 8, !dbg !208
  store i32 %51, i32* %52, align 4, !dbg !209
  store i32 1, i32* %6, align 4, !dbg !210
  br label %55, !dbg !210

53:                                               ; preds = %47
  br label %18, !dbg !151, !llvm.loop !211

54:                                               ; preds = %18
  store i32 0, i32* %6, align 4, !dbg !213
  br label %55, !dbg !213

55:                                               ; preds = %54, %50
  %56 = load i32, i32* %6, align 4, !dbg !214
  ret i32 %56, !dbg !214
}

declare dso_local i32 @xdc_recv(i8*, i8*, %struct._tag*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_rpc_get_ewma_remote_call(i32 %0, double* %1, i8* %2, i8* %3, %struct._tag* %4, %struct._tag* %5) #0 !dbg !215 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca %struct._tag*, align 8
  %13 = alloca %struct._tag*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct._request_get_ewma_datatype, align 1
  %16 = alloca %struct._response_get_ewma_datatype, align 1
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !219, metadata !DIExpression()), !dbg !220
  store double* %1, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !221, metadata !DIExpression()), !dbg !222
  store i8* %2, i8** %10, align 8
  call void @llvm.dbg.declare(metadata i8** %10, metadata !223, metadata !DIExpression()), !dbg !224
  store i8* %3, i8** %11, align 8
  call void @llvm.dbg.declare(metadata i8** %11, metadata !225, metadata !DIExpression()), !dbg !226
  store %struct._tag* %4, %struct._tag** %12, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %12, metadata !227, metadata !DIExpression()), !dbg !228
  store %struct._tag* %5, %struct._tag** %13, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %13, metadata !229, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32* %14, metadata !231, metadata !DIExpression()), !dbg !232
  store i32 15, i32* %14, align 4, !dbg !232
  br label %20, !dbg !233

20:                                               ; preds = %64, %55, %6
  %21 = load i32, i32* %14, align 4, !dbg !234
  %22 = icmp ne i32 %21, 0, !dbg !235
  br i1 %22, label %23, label %65, !dbg !233

23:                                               ; preds = %20
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %15, metadata !236, metadata !DIExpression()), !dbg !238
  %24 = bitcast %struct._request_get_ewma_datatype* %15 to i8*, !dbg !239
  call void @llvm.var.annotation(i8* %24, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 330), !dbg !239
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %16, metadata !240, metadata !DIExpression()), !dbg !241
  %25 = bitcast %struct._response_get_ewma_datatype* %16 to i8*, !dbg !242
  call void @llvm.var.annotation(i8* %25, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 336), !dbg !242
  %26 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %15, i32 0, i32 0, !dbg !243
  store i32 0, i32* %26, align 1, !dbg !244
  %27 = load i32, i32* %8, align 4, !dbg !245
  %28 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %15, i32 0, i32 1, !dbg !246
  %29 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %28, i32 0, i32 0, !dbg !247
  store i32 %27, i32* %29, align 1, !dbg !248
  %30 = load i8*, i8** %10, align 8, !dbg !249
  %31 = bitcast %struct._request_get_ewma_datatype* %15 to i8*, !dbg !250
  %32 = load %struct._tag*, %struct._tag** %12, align 8, !dbg !251
  call void @xdc_asyn_send(i8* %30, i8* %31, %struct._tag* %32), !dbg !252
  call void @llvm.dbg.declare(metadata i32* %17, metadata !253, metadata !DIExpression()), !dbg !254
  %33 = load i8*, i8** %11, align 8, !dbg !255
  %34 = bitcast %struct._response_get_ewma_datatype* %16 to i8*, !dbg !256
  %35 = load %struct._tag*, %struct._tag** %13, align 8, !dbg !257
  %36 = call i32 @xdc_recv(i8* %33, i8* %34, %struct._tag* %35), !dbg !258
  store i32 %36, i32* %17, align 4, !dbg !254
  call void @llvm.dbg.declare(metadata i32* %18, metadata !259, metadata !DIExpression()), !dbg !260
  %37 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 1, !dbg !261
  %38 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %37, i32 0, i32 0, !dbg !262
  %39 = load i32, i32* %38, align 1, !dbg !262
  %40 = lshr i32 %39, 2, !dbg !263
  store i32 %40, i32* %18, align 4, !dbg !260
  call void @llvm.dbg.declare(metadata i32* %19, metadata !264, metadata !DIExpression()), !dbg !265
  %41 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 1, !dbg !266
  %42 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %41, i32 0, i32 0, !dbg !267
  %43 = load i32, i32* %42, align 1, !dbg !267
  %44 = lshr i32 %43, 1, !dbg !268
  %45 = and i32 %44, 1, !dbg !269
  store i32 %45, i32* %19, align 4, !dbg !265
  %46 = load i32, i32* %17, align 4, !dbg !270
  %47 = icmp eq i32 %46, -1, !dbg !272
  br i1 %47, label %48, label %51, !dbg !273

48:                                               ; preds = %23
  %49 = load i32, i32* %14, align 4, !dbg !274
  %50 = add nsw i32 %49, -1, !dbg !274
  store i32 %50, i32* %14, align 4, !dbg !274
  br label %64, !dbg !276

51:                                               ; preds = %23
  %52 = load i32, i32* %18, align 4, !dbg !277
  %53 = load i32, i32* %8, align 4, !dbg !280
  %54 = icmp slt i32 %52, %53, !dbg !281
  br i1 %54, label %55, label %56, !dbg !282

55:                                               ; preds = %51
  br label %20, !dbg !283, !llvm.loop !285

56:                                               ; preds = %51
  %57 = load i32, i32* %19, align 4, !dbg !287
  %58 = icmp ne i32 %57, 0, !dbg !287
  br i1 %58, label %59, label %60, !dbg !289

59:                                               ; preds = %56
  store i32 0, i32* %7, align 4, !dbg !290
  br label %66, !dbg !290

60:                                               ; preds = %56
  %61 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 0, !dbg !292
  %62 = load double, double* %61, align 1, !dbg !292
  %63 = load double*, double** %9, align 8, !dbg !293
  store double %62, double* %63, align 8, !dbg !294
  store i32 1, i32* %7, align 4, !dbg !295
  br label %66, !dbg !295

64:                                               ; preds = %48
  br label %20, !dbg !233, !llvm.loop !285

65:                                               ; preds = %20
  store i32 0, i32* %7, align 4, !dbg !296
  br label %66, !dbg !296

66:                                               ; preds = %65, %60, %59
  %67 = load i32, i32* %7, align 4, !dbg !297
  ret i32 %67, !dbg !297
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @_rpc_get_ewma(i32* %0) #0 !dbg !33 {
  %2 = alloca double, align 8
  %3 = alloca i32*, align 8
  %4 = alloca %struct._tag, align 1
  %5 = alloca %struct._tag, align 1
  %6 = alloca %struct._request_get_ewma_datatype, align 1
  %7 = alloca %struct._response_get_ewma_datatype, align 1
  %8 = alloca { i64, i32 }, align 1
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  call void @llvm.dbg.declare(metadata i32** %3, metadata !298, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !300, metadata !DIExpression()), !dbg !301
  call void @llvm.dbg.declare(metadata %struct._tag* %5, metadata !302, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %6, metadata !304, metadata !DIExpression()), !dbg !305
  %12 = bitcast %struct._request_get_ewma_datatype* %6 to i8*, !dbg !306
  call void @llvm.var.annotation(i8* %12, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 388), !dbg !306
  call void @tag_write(%struct._tag* %4, i32 2, i32 2, i32 3), !dbg !307
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %7, metadata !308, metadata !DIExpression()), !dbg !309
  %13 = bitcast %struct._response_get_ewma_datatype* %7 to i8*, !dbg !310
  call void @llvm.var.annotation(i8* %13, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 398), !dbg !310
  call void @tag_write(%struct._tag* %5, i32 1, i32 1, i32 4), !dbg !311
  %14 = load i32, i32* @_rpc_get_ewma.inited, align 4, !dbg !312
  %15 = icmp ne i32 %14, 0, !dbg !312
  br i1 %15, label %34, label %16, !dbg !314

16:                                               ; preds = %1
  store i32 1, i32* @_rpc_get_ewma.inited, align 4, !dbg !315
  %17 = call i8* @xdc_pub_socket(), !dbg !317
  store i8* %17, i8** @_rpc_get_ewma.psocket, align 8, !dbg !318
  %18 = bitcast { i64, i32 }* %8 to i8*, !dbg !319
  %19 = bitcast %struct._tag* %5 to i8*, !dbg !319
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %18, i8* align 1 %19, i64 12, i1 false), !dbg !319
  %20 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %8, i32 0, i32 0, !dbg !319
  %21 = load i64, i64* %20, align 1, !dbg !319
  %22 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %8, i32 0, i32 1, !dbg !319
  %23 = load i32, i32* %22, align 1, !dbg !319
  %24 = call i8* @xdc_sub_socket_non_blocking(i64 %21, i32 %23, i32 1000), !dbg !319
  store i8* %24, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !320
  %25 = call i32 @sleep(i32 1), !dbg !321
  call void @llvm.dbg.declare(metadata i32* %9, metadata !322, metadata !DIExpression()), !dbg !323
  %26 = load i8*, i8** @_rpc_get_ewma.psocket, align 8, !dbg !324
  %27 = load i8*, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !325
  %28 = call i32 @_rpc_get_ewma_sync_request_counter(i32* @_rpc_get_ewma.request_counter, i8* %26, i8* %27, %struct._tag* %4, %struct._tag* %5), !dbg !326
  store i32 %28, i32* %9, align 4, !dbg !323
  %29 = load i32, i32* %9, align 4, !dbg !327
  %30 = icmp eq i32 %29, 0, !dbg !329
  br i1 %30, label %31, label %33, !dbg !330

31:                                               ; preds = %16
  %32 = load i32*, i32** %3, align 8, !dbg !331
  store i32 1, i32* %32, align 4, !dbg !333
  store double 0.000000e+00, double* %2, align 8, !dbg !334
  br label %47, !dbg !334

33:                                               ; preds = %16
  br label %34, !dbg !335

34:                                               ; preds = %33, %1
  %35 = load i32, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !336
  %36 = add nsw i32 %35, 1, !dbg !336
  store i32 %36, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !336
  call void @llvm.dbg.declare(metadata double* %10, metadata !337, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.declare(metadata i32* %11, metadata !339, metadata !DIExpression()), !dbg !340
  %37 = load i32, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !341
  %38 = load i8*, i8** @_rpc_get_ewma.psocket, align 8, !dbg !342
  %39 = load i8*, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !343
  %40 = call i32 @_rpc_get_ewma_remote_call(i32 %37, double* %10, i8* %38, i8* %39, %struct._tag* %4, %struct._tag* %5), !dbg !344
  store i32 %40, i32* %11, align 4, !dbg !340
  %41 = load i32, i32* %11, align 4, !dbg !345
  %42 = icmp eq i32 %41, 0, !dbg !347
  br i1 %42, label %43, label %45, !dbg !348

43:                                               ; preds = %34
  %44 = load i32*, i32** %3, align 8, !dbg !349
  store i32 1, i32* %44, align 4, !dbg !351
  store double 0.000000e+00, double* %2, align 8, !dbg !352
  br label %47, !dbg !352

45:                                               ; preds = %34
  %46 = load double, double* %10, align 8, !dbg !353
  store double %46, double* %2, align 8, !dbg !354
  br label %47, !dbg !354

47:                                               ; preds = %45, %43, %31
  %48 = load double, double* %2, align 8, !dbg !355
  ret double %48, !dbg !355
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_master_rpc_init() #0 !dbg !356 {
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0)), !dbg !359
  ret void, !dbg !360
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
!3 = !DIFile(filename: "./partitioned/multithreaded/purple/purple_rpc.c", directory: "/workspaces/build/apps/examples/example3")
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
!20 = !DIFile(filename: "partitioned/multithreaded/purple/purple_rpc.c", directory: "/workspaces/build/apps/examples/example3")
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
!35 = !{!36, !37}
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
!73 = !DIFile(filename: "./partitioned/multithreaded/autogen/codec.h", directory: "/workspaces/build/apps/examples/example3")
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
!138 = !{!38, !37, !28, !28, !6, !6}
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
!149 = !DILocalVariable(name: "tries_remaining", scope: !136, file: !3, line: 292, type: !38)
!150 = !DILocation(line: 292, column: 9, scope: !136)
!151 = !DILocation(line: 293, column: 5, scope: !136)
!152 = !DILocation(line: 293, column: 11, scope: !136)
!153 = !DILocation(line: 293, column: 27, scope: !136)
!154 = !DILocalVariable(name: "req_get_ewma", scope: !155, file: !3, line: 296, type: !156)
!155 = distinct !DILexicalBlock(scope: !136, file: !3, line: 293, column: 32)
!156 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_ewma_datatype", file: !73, line: 61, baseType: !157)
!157 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_ewma_datatype", file: !73, line: 58, size: 160, elements: !158)
!158 = !{!159, !160}
!159 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !157, file: !73, line: 59, baseType: !77, size: 32)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !157, file: !73, line: 60, baseType: !83, size: 128, offset: 32)
!161 = !DILocation(line: 296, column: 35, scope: !155)
!162 = !DILocation(line: 296, column: 9, scope: !155)
!163 = !DILocalVariable(name: "res_get_ewma", scope: !155, file: !3, line: 302, type: !164)
!164 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_ewma_datatype", file: !73, line: 71, baseType: !165)
!165 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_ewma_datatype", file: !73, line: 68, size: 192, elements: !166)
!166 = !{!167, !168}
!167 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !165, file: !73, line: 69, baseType: !36, size: 64)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !165, file: !73, line: 70, baseType: !83, size: 128, offset: 64)
!169 = !DILocation(line: 302, column: 36, scope: !155)
!170 = !DILocation(line: 302, column: 9, scope: !155)
!171 = !DILocation(line: 306, column: 22, scope: !155)
!172 = !DILocation(line: 306, column: 28, scope: !155)
!173 = !DILocation(line: 307, column: 37, scope: !155)
!174 = !DILocation(line: 307, column: 36, scope: !155)
!175 = !DILocation(line: 307, column: 22, scope: !155)
!176 = !DILocation(line: 307, column: 30, scope: !155)
!177 = !DILocation(line: 307, column: 34, scope: !155)
!178 = !DILocation(line: 308, column: 23, scope: !155)
!179 = !DILocation(line: 308, column: 32, scope: !155)
!180 = !DILocation(line: 308, column: 47, scope: !155)
!181 = !DILocation(line: 308, column: 9, scope: !155)
!182 = !DILocalVariable(name: "status", scope: !155, file: !3, line: 310, type: !38)
!183 = !DILocation(line: 310, column: 13, scope: !155)
!184 = !DILocation(line: 310, column: 31, scope: !155)
!185 = !DILocation(line: 310, column: 40, scope: !155)
!186 = !DILocation(line: 310, column: 55, scope: !155)
!187 = !DILocation(line: 310, column: 22, scope: !155)
!188 = !DILocalVariable(name: "respId", scope: !155, file: !3, line: 312, type: !38)
!189 = !DILocation(line: 312, column: 13, scope: !155)
!190 = !DILocation(line: 312, column: 35, scope: !155)
!191 = !DILocation(line: 312, column: 43, scope: !155)
!192 = !DILocation(line: 312, column: 47, scope: !155)
!193 = !DILocalVariable(name: "error", scope: !155, file: !3, line: 313, type: !38)
!194 = !DILocation(line: 313, column: 13, scope: !155)
!195 = !DILocation(line: 313, column: 35, scope: !155)
!196 = !DILocation(line: 313, column: 43, scope: !155)
!197 = !DILocation(line: 313, column: 47, scope: !155)
!198 = !DILocation(line: 313, column: 52, scope: !155)
!199 = !DILocation(line: 314, column: 12, scope: !200)
!200 = distinct !DILexicalBlock(scope: !155, file: !3, line: 314, column: 12)
!201 = !DILocation(line: 314, column: 19, scope: !200)
!202 = !DILocation(line: 314, column: 12, scope: !155)
!203 = !DILocation(line: 315, column: 28, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !3, line: 314, column: 25)
!205 = !DILocation(line: 316, column: 9, scope: !204)
!206 = !DILocation(line: 318, column: 32, scope: !207)
!207 = distinct !DILexicalBlock(scope: !200, file: !3, line: 317, column: 13)
!208 = !DILocation(line: 318, column: 14, scope: !207)
!209 = !DILocation(line: 318, column: 30, scope: !207)
!210 = !DILocation(line: 319, column: 13, scope: !207)
!211 = distinct !{!211, !151, !212}
!212 = !DILocation(line: 321, column: 5, scope: !136)
!213 = !DILocation(line: 322, column: 5, scope: !136)
!214 = !DILocation(line: 323, column: 1, scope: !136)
!215 = distinct !DISubprogram(name: "_rpc_get_ewma_remote_call", scope: !3, file: !3, line: 325, type: !216, scopeLine: 325, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!216 = !DISubroutineType(types: !217)
!217 = !{!38, !38, !218, !28, !28, !6, !6}
!218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!219 = !DILocalVariable(name: "reqId", arg: 1, scope: !215, file: !3, line: 325, type: !38)
!220 = !DILocation(line: 325, column: 35, scope: !215)
!221 = !DILocalVariable(name: "result", arg: 2, scope: !215, file: !3, line: 325, type: !218)
!222 = !DILocation(line: 325, column: 50, scope: !215)
!223 = !DILocalVariable(name: "psocket", arg: 3, scope: !215, file: !3, line: 325, type: !28)
!224 = !DILocation(line: 325, column: 64, scope: !215)
!225 = !DILocalVariable(name: "ssocket", arg: 4, scope: !215, file: !3, line: 325, type: !28)
!226 = !DILocation(line: 325, column: 79, scope: !215)
!227 = !DILocalVariable(name: "t_tag", arg: 5, scope: !215, file: !3, line: 325, type: !6)
!228 = !DILocation(line: 325, column: 98, scope: !215)
!229 = !DILocalVariable(name: "o_tag", arg: 6, scope: !215, file: !3, line: 325, type: !6)
!230 = !DILocation(line: 325, column: 115, scope: !215)
!231 = !DILocalVariable(name: "tries_remaining", scope: !215, file: !3, line: 326, type: !38)
!232 = !DILocation(line: 326, column: 9, scope: !215)
!233 = !DILocation(line: 327, column: 5, scope: !215)
!234 = !DILocation(line: 327, column: 11, scope: !215)
!235 = !DILocation(line: 327, column: 26, scope: !215)
!236 = !DILocalVariable(name: "req_get_ewma", scope: !237, file: !3, line: 330, type: !156)
!237 = distinct !DILexicalBlock(scope: !215, file: !3, line: 327, column: 30)
!238 = !DILocation(line: 330, column: 35, scope: !237)
!239 = !DILocation(line: 330, column: 9, scope: !237)
!240 = !DILocalVariable(name: "res_get_ewma", scope: !237, file: !3, line: 336, type: !164)
!241 = !DILocation(line: 336, column: 36, scope: !237)
!242 = !DILocation(line: 336, column: 9, scope: !237)
!243 = !DILocation(line: 340, column: 22, scope: !237)
!244 = !DILocation(line: 340, column: 28, scope: !237)
!245 = !DILocation(line: 341, column: 36, scope: !237)
!246 = !DILocation(line: 341, column: 22, scope: !237)
!247 = !DILocation(line: 341, column: 30, scope: !237)
!248 = !DILocation(line: 341, column: 34, scope: !237)
!249 = !DILocation(line: 342, column: 23, scope: !237)
!250 = !DILocation(line: 342, column: 32, scope: !237)
!251 = !DILocation(line: 342, column: 47, scope: !237)
!252 = !DILocation(line: 342, column: 9, scope: !237)
!253 = !DILocalVariable(name: "status", scope: !237, file: !3, line: 344, type: !38)
!254 = !DILocation(line: 344, column: 13, scope: !237)
!255 = !DILocation(line: 344, column: 31, scope: !237)
!256 = !DILocation(line: 344, column: 40, scope: !237)
!257 = !DILocation(line: 344, column: 55, scope: !237)
!258 = !DILocation(line: 344, column: 22, scope: !237)
!259 = !DILocalVariable(name: "respId", scope: !237, file: !3, line: 346, type: !38)
!260 = !DILocation(line: 346, column: 13, scope: !237)
!261 = !DILocation(line: 346, column: 35, scope: !237)
!262 = !DILocation(line: 346, column: 43, scope: !237)
!263 = !DILocation(line: 346, column: 47, scope: !237)
!264 = !DILocalVariable(name: "error", scope: !237, file: !3, line: 347, type: !38)
!265 = !DILocation(line: 347, column: 13, scope: !237)
!266 = !DILocation(line: 347, column: 35, scope: !237)
!267 = !DILocation(line: 347, column: 43, scope: !237)
!268 = !DILocation(line: 347, column: 47, scope: !237)
!269 = !DILocation(line: 347, column: 52, scope: !237)
!270 = !DILocation(line: 348, column: 12, scope: !271)
!271 = distinct !DILexicalBlock(scope: !237, file: !3, line: 348, column: 12)
!272 = !DILocation(line: 348, column: 19, scope: !271)
!273 = !DILocation(line: 348, column: 12, scope: !237)
!274 = !DILocation(line: 349, column: 28, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !3, line: 348, column: 25)
!276 = !DILocation(line: 350, column: 9, scope: !275)
!277 = !DILocation(line: 352, column: 16, scope: !278)
!278 = distinct !DILexicalBlock(scope: !279, file: !3, line: 352, column: 16)
!279 = distinct !DILexicalBlock(scope: !271, file: !3, line: 351, column: 13)
!280 = !DILocation(line: 352, column: 25, scope: !278)
!281 = !DILocation(line: 352, column: 23, scope: !278)
!282 = !DILocation(line: 352, column: 16, scope: !279)
!283 = !DILocation(line: 353, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !278, file: !3, line: 352, column: 31)
!285 = distinct !{!285, !233, !286}
!286 = !DILocation(line: 361, column: 5, scope: !215)
!287 = !DILocation(line: 355, column: 16, scope: !288)
!288 = distinct !DILexicalBlock(scope: !279, file: !3, line: 355, column: 16)
!289 = !DILocation(line: 355, column: 16, scope: !279)
!290 = !DILocation(line: 356, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !3, line: 355, column: 22)
!292 = !DILocation(line: 358, column: 36, scope: !279)
!293 = !DILocation(line: 358, column: 14, scope: !279)
!294 = !DILocation(line: 358, column: 21, scope: !279)
!295 = !DILocation(line: 359, column: 13, scope: !279)
!296 = !DILocation(line: 362, column: 5, scope: !215)
!297 = !DILocation(line: 363, column: 1, scope: !215)
!298 = !DILocalVariable(name: "error", arg: 1, scope: !33, file: !3, line: 365, type: !37)
!299 = !DILocation(line: 365, column: 27, scope: !33)
!300 = !DILocalVariable(name: "t_tag", scope: !33, file: !3, line: 383, type: !7)
!301 = !DILocation(line: 383, column: 14, scope: !33)
!302 = !DILocalVariable(name: "o_tag", scope: !33, file: !3, line: 384, type: !7)
!303 = !DILocation(line: 384, column: 14, scope: !33)
!304 = !DILocalVariable(name: "req_get_ewma", scope: !33, file: !3, line: 388, type: !156)
!305 = !DILocation(line: 388, column: 31, scope: !33)
!306 = !DILocation(line: 388, column: 5, scope: !33)
!307 = !DILocation(line: 394, column: 5, scope: !33)
!308 = !DILocalVariable(name: "res_get_ewma", scope: !33, file: !3, line: 398, type: !164)
!309 = !DILocation(line: 398, column: 32, scope: !33)
!310 = !DILocation(line: 398, column: 5, scope: !33)
!311 = !DILocation(line: 404, column: 5, scope: !33)
!312 = !DILocation(line: 418, column: 10, scope: !313)
!313 = distinct !DILexicalBlock(scope: !33, file: !3, line: 418, column: 9)
!314 = !DILocation(line: 418, column: 9, scope: !33)
!315 = !DILocation(line: 419, column: 16, scope: !316)
!316 = distinct !DILexicalBlock(scope: !313, file: !3, line: 418, column: 18)
!317 = !DILocation(line: 420, column: 19, scope: !316)
!318 = !DILocation(line: 420, column: 17, scope: !316)
!319 = !DILocation(line: 421, column: 19, scope: !316)
!320 = !DILocation(line: 421, column: 17, scope: !316)
!321 = !DILocation(line: 422, column: 9, scope: !316)
!322 = !DILocalVariable(name: "status", scope: !316, file: !3, line: 423, type: !38)
!323 = !DILocation(line: 423, column: 13, scope: !316)
!324 = !DILocation(line: 423, column: 75, scope: !316)
!325 = !DILocation(line: 423, column: 84, scope: !316)
!326 = !DILocation(line: 423, column: 22, scope: !316)
!327 = !DILocation(line: 424, column: 12, scope: !328)
!328 = distinct !DILexicalBlock(scope: !316, file: !3, line: 424, column: 12)
!329 = !DILocation(line: 424, column: 19, scope: !328)
!330 = !DILocation(line: 424, column: 12, scope: !316)
!331 = !DILocation(line: 425, column: 14, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !3, line: 424, column: 24)
!333 = !DILocation(line: 425, column: 20, scope: !332)
!334 = !DILocation(line: 426, column: 13, scope: !332)
!335 = !DILocation(line: 428, column: 5, scope: !316)
!336 = !DILocation(line: 429, column: 20, scope: !33)
!337 = !DILocalVariable(name: "result", scope: !33, file: !3, line: 442, type: !36)
!338 = !DILocation(line: 442, column: 12, scope: !33)
!339 = !DILocalVariable(name: "status1", scope: !33, file: !3, line: 443, type: !38)
!340 = !DILocation(line: 443, column: 9, scope: !33)
!341 = !DILocation(line: 443, column: 45, scope: !33)
!342 = !DILocation(line: 443, column: 72, scope: !33)
!343 = !DILocation(line: 443, column: 81, scope: !33)
!344 = !DILocation(line: 443, column: 19, scope: !33)
!345 = !DILocation(line: 444, column: 8, scope: !346)
!346 = distinct !DILexicalBlock(scope: !33, file: !3, line: 444, column: 8)
!347 = !DILocation(line: 444, column: 16, scope: !346)
!348 = !DILocation(line: 444, column: 8, scope: !33)
!349 = !DILocation(line: 445, column: 10, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !3, line: 444, column: 21)
!351 = !DILocation(line: 445, column: 16, scope: !350)
!352 = !DILocation(line: 446, column: 9, scope: !350)
!353 = !DILocation(line: 450, column: 13, scope: !33)
!354 = !DILocation(line: 450, column: 5, scope: !33)
!355 = !DILocation(line: 454, column: 1, scope: !33)
!356 = distinct !DISubprogram(name: "_master_rpc_init", scope: !3, file: !3, line: 456, type: !357, scopeLine: 456, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!357 = !DISubroutineType(types: !358)
!358 = !{null}
!359 = !DILocation(line: 457, column: 5, scope: !356)
!360 = !DILocation(line: 458, column: 1, scope: !356)
