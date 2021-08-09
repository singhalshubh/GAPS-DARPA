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
@_notify_next_tag.psocket = internal global i8* null, align 8, !dbg !31
@_notify_next_tag.ssocket = internal global i8* null, align 8, !dbg !34
@.str = private unnamed_addr constant [12 x i8] c"TAG_NEXTRPC\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [48 x i8] c"./partitioned/multithreaded/orange/orange_rpc.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [9 x i8] c"TAG_OKAY\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [21 x i8] c"TAG_REQUEST_GET_EWMA\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [22 x i8] c"TAG_RESPONSE_GET_EWMA\00", section "llvm.metadata"
@_rpc_get_ewma.inited = internal global i32 0, align 4, !dbg !36
@_rpc_get_ewma.psocket = internal global i8* null, align 8, !dbg !45
@_rpc_get_ewma.ssocket = internal global i8* null, align 8, !dbg !47
@_rpc_get_ewma.request_counter = internal global i32 -2147483648, align 4, !dbg !49
@.str.5 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_suborange\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_puborange\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_hal_init(i8* %0, i8* %1) #0 !dbg !55 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !58, metadata !DIExpression()), !dbg !59
  store i8* %1, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !60, metadata !DIExpression()), !dbg !61
  %5 = load i8*, i8** %3, align 8, !dbg !62
  %6 = call i8* @xdc_set_in(i8* %5), !dbg !63
  %7 = load i8*, i8** %4, align 8, !dbg !64
  %8 = call i8* @xdc_set_out(i8* %7), !dbg !65
  call void @xdc_register(void (i8*, i8*, i64*)* @nextrpc_data_encode, void (i8*, i8*, i64*)* @nextrpc_data_decode, i32 1), !dbg !66
  call void @xdc_register(void (i8*, i8*, i64*)* @okay_data_encode, void (i8*, i8*, i64*)* @okay_data_decode, i32 2), !dbg !67
  call void @xdc_register(void (i8*, i8*, i64*)* @request_get_ewma_data_encode, void (i8*, i8*, i64*)* @request_get_ewma_data_decode, i32 3), !dbg !68
  call void @xdc_register(void (i8*, i8*, i64*)* @response_get_ewma_data_encode, void (i8*, i8*, i64*)* @response_get_ewma_data_decode, i32 4), !dbg !69
  ret void, !dbg !70
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
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata %struct._nextrpc_datatype* %5, metadata !77, metadata !DIExpression()), !dbg !100
  %8 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !101
  call void @llvm.var.annotation(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 138), !dbg !101
  call void @tag_write(%struct._tag* %3, i32 1, i32 1, i32 1), !dbg !102
  call void @llvm.dbg.declare(metadata %struct._okay_datatype* %6, metadata !103, metadata !DIExpression()), !dbg !109
  %9 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !110
  call void @llvm.var.annotation(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 148), !dbg !110
  call void @tag_write(%struct._tag* %4, i32 2, i32 2, i32 2), !dbg !111
  %10 = load i32, i32* @_notify_next_tag.inited, align 4, !dbg !112
  %11 = icmp ne i32 %10, 0, !dbg !112
  br i1 %11, label %22, label %12, !dbg !114

12:                                               ; preds = %1
  store i32 1, i32* @_notify_next_tag.inited, align 4, !dbg !115
  %13 = call i8* @xdc_pub_socket(), !dbg !117
  store i8* %13, i8** @_notify_next_tag.psocket, align 8, !dbg !118
  %14 = bitcast { i64, i32 }* %7 to i8*, !dbg !119
  %15 = bitcast %struct._tag* %4 to i8*, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %14, i8* align 1 %15, i64 12, i1 false), !dbg !119
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !119
  %17 = load i64, i64* %16, align 1, !dbg !119
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !119
  %19 = load i32, i32* %18, align 1, !dbg !119
  %20 = call i8* @xdc_sub_socket_non_blocking(i64 %17, i32 %19, i32 1000), !dbg !119
  store i8* %20, i8** @_notify_next_tag.ssocket, align 8, !dbg !120
  %21 = call i32 @sleep(i32 1), !dbg !121
  br label %22, !dbg !122

22:                                               ; preds = %12, %1
  %23 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !123
  %24 = getelementptr inbounds %struct._tag, %struct._tag* %23, i32 0, i32 0, !dbg !124
  %25 = load i32, i32* %24, align 1, !dbg !124
  %26 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 0, !dbg !125
  store i32 %25, i32* %26, align 1, !dbg !126
  %27 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !127
  %28 = getelementptr inbounds %struct._tag, %struct._tag* %27, i32 0, i32 1, !dbg !128
  %29 = load i32, i32* %28, align 1, !dbg !128
  %30 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 1, !dbg !129
  store i32 %29, i32* %30, align 1, !dbg !130
  %31 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !131
  %32 = getelementptr inbounds %struct._tag, %struct._tag* %31, i32 0, i32 2, !dbg !132
  %33 = load i32, i32* %32, align 1, !dbg !132
  %34 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 2, !dbg !133
  store i32 %33, i32* %34, align 1, !dbg !134
  %35 = load i8*, i8** @_notify_next_tag.psocket, align 8, !dbg !135
  %36 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !136
  call void @xdc_asyn_send(i8* %35, i8* %36, %struct._tag* %3), !dbg !137
  %37 = load i8*, i8** @_notify_next_tag.ssocket, align 8, !dbg !138
  %38 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !139
  call void @xdc_blocking_recv(i8* %37, i8* %38, %struct._tag* %4), !dbg !140
  ret void, !dbg !141
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
define dso_local i32 @_rpc_get_ewma_sync_request_counter(i32* %0, i8* %1, i8* %2, %struct._tag* %3, %struct._tag* %4) #0 !dbg !142 {
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
  %17 = alloca i8, align 1
  %18 = alloca i8, align 1
  store i32* %0, i32** %7, align 8
  call void @llvm.dbg.declare(metadata i32** %7, metadata !145, metadata !DIExpression()), !dbg !146
  store i8* %1, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !147, metadata !DIExpression()), !dbg !148
  store i8* %2, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !149, metadata !DIExpression()), !dbg !150
  store %struct._tag* %3, %struct._tag** %10, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %10, metadata !151, metadata !DIExpression()), !dbg !152
  store %struct._tag* %4, %struct._tag** %11, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %11, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i32* %12, metadata !155, metadata !DIExpression()), !dbg !156
  store i32 5, i32* %12, align 4, !dbg !156
  br label %19, !dbg !157

19:                                               ; preds = %61, %5
  %20 = load i32, i32* %12, align 4, !dbg !158
  %21 = icmp ne i32 %20, 0, !dbg !159
  br i1 %21, label %22, label %62, !dbg !157

22:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %13, metadata !160, metadata !DIExpression()), !dbg !167
  %23 = bitcast %struct._request_get_ewma_datatype* %13 to i8*, !dbg !168
  call void @llvm.var.annotation(i8* %23, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 196), !dbg !168
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %14, metadata !169, metadata !DIExpression()), !dbg !175
  %24 = bitcast %struct._response_get_ewma_datatype* %14 to i8*, !dbg !176
  call void @llvm.var.annotation(i8* %24, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 202), !dbg !176
  %25 = load i32*, i32** %7, align 8, !dbg !177
  %26 = load i32, i32* %25, align 4, !dbg !178
  %27 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %13, i32 0, i32 1, !dbg !179
  %28 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %27, i32 0, i32 0, !dbg !180
  store i32 %26, i32* %28, align 1, !dbg !181
  %29 = load i8*, i8** %8, align 8, !dbg !182
  %30 = bitcast %struct._request_get_ewma_datatype* %13 to i8*, !dbg !183
  %31 = load %struct._tag*, %struct._tag** %10, align 8, !dbg !184
  call void @xdc_asyn_send(i8* %29, i8* %30, %struct._tag* %31), !dbg !185
  call void @llvm.dbg.declare(metadata i32* %15, metadata !186, metadata !DIExpression()), !dbg !187
  %32 = load i8*, i8** %9, align 8, !dbg !188
  %33 = bitcast %struct._response_get_ewma_datatype* %14 to i8*, !dbg !189
  %34 = load %struct._tag*, %struct._tag** %11, align 8, !dbg !190
  %35 = call i32 @xdc_recv(i8* %32, i8* %33, %struct._tag* %34), !dbg !191
  store i32 %35, i32* %15, align 4, !dbg !187
  call void @llvm.dbg.declare(metadata i32* %16, metadata !192, metadata !DIExpression()), !dbg !193
  %36 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %14, i32 0, i32 1, !dbg !194
  %37 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %36, i32 0, i32 0, !dbg !195
  %38 = load i32, i32* %37, align 1, !dbg !195
  %39 = lshr i32 %38, 2, !dbg !196
  store i32 %39, i32* %16, align 4, !dbg !193
  call void @llvm.dbg.declare(metadata i8* %17, metadata !197, metadata !DIExpression()), !dbg !199
  %40 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %14, i32 0, i32 1, !dbg !200
  %41 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %40, i32 0, i32 0, !dbg !201
  %42 = load i32, i32* %41, align 1, !dbg !201
  %43 = lshr i32 %42, 1, !dbg !202
  %44 = and i32 %43, 1, !dbg !203
  %45 = icmp ne i32 %44, 0, !dbg !204
  %46 = zext i1 %45 to i8, !dbg !199
  store i8 %46, i8* %17, align 1, !dbg !199
  call void @llvm.dbg.declare(metadata i8* %18, metadata !205, metadata !DIExpression()), !dbg !206
  %47 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %14, i32 0, i32 1, !dbg !207
  %48 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %47, i32 0, i32 0, !dbg !208
  %49 = load i32, i32* %48, align 1, !dbg !208
  %50 = and i32 %49, 1, !dbg !209
  %51 = icmp ne i32 %50, 0, !dbg !210
  %52 = zext i1 %51 to i8, !dbg !206
  store i8 %52, i8* %18, align 1, !dbg !206
  %53 = load i32, i32* %15, align 4, !dbg !211
  %54 = icmp eq i32 %53, -1, !dbg !213
  br i1 %54, label %55, label %58, !dbg !214

55:                                               ; preds = %22
  %56 = load i32, i32* %12, align 4, !dbg !215
  %57 = add nsw i32 %56, -1, !dbg !215
  store i32 %57, i32* %12, align 4, !dbg !215
  br label %61, !dbg !217

58:                                               ; preds = %22
  %59 = load i32, i32* %16, align 4, !dbg !218
  %60 = load i32*, i32** %7, align 8, !dbg !220
  store i32 %59, i32* %60, align 4, !dbg !221
  store i32 1, i32* %6, align 4, !dbg !222
  br label %63, !dbg !222

61:                                               ; preds = %55
  br label %19, !dbg !157, !llvm.loop !223

62:                                               ; preds = %19
  store i32 0, i32* %6, align 4, !dbg !225
  br label %63, !dbg !225

63:                                               ; preds = %62, %58
  %64 = load i32, i32* %6, align 4, !dbg !226
  ret i32 %64, !dbg !226
}

declare dso_local i32 @xdc_recv(i8*, i8*, %struct._tag*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_rpc_get_ewma_remote_call(i32 %0, double* %1, i8* %2, i8* %3, %struct._tag* %4, %struct._tag* %5) #0 !dbg !227 {
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
  %19 = alloca i8, align 1
  %20 = alloca i8, align 1
  store i32 %0, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !231, metadata !DIExpression()), !dbg !232
  store double* %1, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !233, metadata !DIExpression()), !dbg !234
  store i8* %2, i8** %10, align 8
  call void @llvm.dbg.declare(metadata i8** %10, metadata !235, metadata !DIExpression()), !dbg !236
  store i8* %3, i8** %11, align 8
  call void @llvm.dbg.declare(metadata i8** %11, metadata !237, metadata !DIExpression()), !dbg !238
  store %struct._tag* %4, %struct._tag** %12, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %12, metadata !239, metadata !DIExpression()), !dbg !240
  store %struct._tag* %5, %struct._tag** %13, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %13, metadata !241, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.declare(metadata i32* %14, metadata !243, metadata !DIExpression()), !dbg !244
  store i32 5, i32* %14, align 4, !dbg !244
  br label %21, !dbg !245

21:                                               ; preds = %79, %63, %6
  %22 = load i32, i32* %14, align 4, !dbg !246
  %23 = icmp ne i32 %22, 0, !dbg !247
  br i1 %23, label %24, label %80, !dbg !245

24:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %15, metadata !248, metadata !DIExpression()), !dbg !250
  %25 = bitcast %struct._request_get_ewma_datatype* %15 to i8*, !dbg !251
  call void @llvm.var.annotation(i8* %25, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 228), !dbg !251
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %16, metadata !252, metadata !DIExpression()), !dbg !253
  %26 = bitcast %struct._response_get_ewma_datatype* %16 to i8*, !dbg !254
  call void @llvm.var.annotation(i8* %26, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 234), !dbg !254
  %27 = load i32, i32* %8, align 4, !dbg !255
  %28 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %15, i32 0, i32 1, !dbg !256
  %29 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %28, i32 0, i32 0, !dbg !257
  store i32 %27, i32* %29, align 1, !dbg !258
  %30 = load i8*, i8** %10, align 8, !dbg !259
  %31 = bitcast %struct._request_get_ewma_datatype* %15 to i8*, !dbg !260
  %32 = load %struct._tag*, %struct._tag** %12, align 8, !dbg !261
  call void @xdc_asyn_send(i8* %30, i8* %31, %struct._tag* %32), !dbg !262
  call void @llvm.dbg.declare(metadata i32* %17, metadata !263, metadata !DIExpression()), !dbg !264
  %33 = load i8*, i8** %11, align 8, !dbg !265
  %34 = bitcast %struct._response_get_ewma_datatype* %16 to i8*, !dbg !266
  %35 = load %struct._tag*, %struct._tag** %13, align 8, !dbg !267
  %36 = call i32 @xdc_recv(i8* %33, i8* %34, %struct._tag* %35), !dbg !268
  store i32 %36, i32* %17, align 4, !dbg !264
  call void @llvm.dbg.declare(metadata i32* %18, metadata !269, metadata !DIExpression()), !dbg !270
  %37 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 1, !dbg !271
  %38 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %37, i32 0, i32 0, !dbg !272
  %39 = load i32, i32* %38, align 1, !dbg !272
  %40 = lshr i32 %39, 2, !dbg !273
  store i32 %40, i32* %18, align 4, !dbg !270
  call void @llvm.dbg.declare(metadata i8* %19, metadata !274, metadata !DIExpression()), !dbg !275
  %41 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 1, !dbg !276
  %42 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %41, i32 0, i32 0, !dbg !277
  %43 = load i32, i32* %42, align 1, !dbg !277
  %44 = lshr i32 %43, 1, !dbg !278
  %45 = and i32 %44, 1, !dbg !279
  %46 = icmp ne i32 %45, 0, !dbg !280
  %47 = zext i1 %46 to i8, !dbg !275
  store i8 %47, i8* %19, align 1, !dbg !275
  call void @llvm.dbg.declare(metadata i8* %20, metadata !281, metadata !DIExpression()), !dbg !282
  %48 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 1, !dbg !283
  %49 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %48, i32 0, i32 0, !dbg !284
  %50 = load i32, i32* %49, align 1, !dbg !284
  %51 = and i32 %50, 1, !dbg !285
  %52 = icmp ne i32 %51, 0, !dbg !286
  %53 = zext i1 %52 to i8, !dbg !282
  store i8 %53, i8* %20, align 1, !dbg !282
  %54 = load i32, i32* %17, align 4, !dbg !287
  %55 = icmp eq i32 %54, -1, !dbg !289
  br i1 %55, label %56, label %59, !dbg !290

56:                                               ; preds = %24
  %57 = load i32, i32* %14, align 4, !dbg !291
  %58 = add nsw i32 %57, -1, !dbg !291
  store i32 %58, i32* %14, align 4, !dbg !291
  br label %79, !dbg !293

59:                                               ; preds = %24
  %60 = load i32, i32* %18, align 4, !dbg !294
  %61 = load i32, i32* %8, align 4, !dbg !297
  %62 = icmp slt i32 %60, %61, !dbg !298
  br i1 %62, label %63, label %64, !dbg !299

63:                                               ; preds = %59
  br label %21, !dbg !300, !llvm.loop !302

64:                                               ; preds = %59
  %65 = load i8, i8* %19, align 1, !dbg !304
  %66 = trunc i8 %65 to i1, !dbg !304
  br i1 %66, label %67, label %68, !dbg !306

67:                                               ; preds = %64
  store i32 0, i32* %7, align 4, !dbg !307
  br label %81, !dbg !307

68:                                               ; preds = %64
  %69 = load i8, i8* %20, align 1, !dbg !309
  %70 = trunc i8 %69 to i1, !dbg !309
  br i1 %70, label %71, label %75, !dbg !311

71:                                               ; preds = %68
  %72 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 0, !dbg !312
  %73 = load double, double* %72, align 1, !dbg !312
  %74 = load double*, double** %9, align 8, !dbg !314
  store double %73, double* %74, align 8, !dbg !315
  store i32 2, i32* %7, align 4, !dbg !316
  br label %81, !dbg !316

75:                                               ; preds = %68
  %76 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 0, !dbg !317
  %77 = load double, double* %76, align 1, !dbg !317
  %78 = load double*, double** %9, align 8, !dbg !318
  store double %77, double* %78, align 8, !dbg !319
  store i32 1, i32* %7, align 4, !dbg !320
  br label %81, !dbg !320

79:                                               ; preds = %56
  br label %21, !dbg !245, !llvm.loop !302

80:                                               ; preds = %21
  store i32 0, i32* %7, align 4, !dbg !321
  br label %81, !dbg !321

81:                                               ; preds = %80, %75, %71, %67
  %82 = load i32, i32* %7, align 4, !dbg !322
  ret i32 %82, !dbg !322
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @_rpc_get_ewma(double %0, i32* %1, i32* %2) #0 !dbg !38 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca %struct._tag, align 1
  %9 = alloca %struct._tag, align 1
  %10 = alloca %struct._request_get_ewma_datatype, align 1
  %11 = alloca %struct._response_get_ewma_datatype, align 1
  %12 = alloca { i64, i32 }, align 1
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  %15 = alloca i32, align 4
  store double %0, double* %5, align 8
  call void @llvm.dbg.declare(metadata double* %5, metadata !323, metadata !DIExpression()), !dbg !324
  store i32* %1, i32** %6, align 8
  call void @llvm.dbg.declare(metadata i32** %6, metadata !325, metadata !DIExpression()), !dbg !326
  store i32* %2, i32** %7, align 8
  call void @llvm.dbg.declare(metadata i32** %7, metadata !327, metadata !DIExpression()), !dbg !328
  call void @llvm.dbg.declare(metadata %struct._tag* %8, metadata !329, metadata !DIExpression()), !dbg !330
  call void @llvm.dbg.declare(metadata %struct._tag* %9, metadata !331, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %10, metadata !333, metadata !DIExpression()), !dbg !334
  %16 = bitcast %struct._request_get_ewma_datatype* %10 to i8*, !dbg !335
  call void @llvm.var.annotation(i8* %16, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 286), !dbg !335
  call void @tag_write(%struct._tag* %8, i32 1, i32 1, i32 3), !dbg !336
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %11, metadata !337, metadata !DIExpression()), !dbg !338
  %17 = bitcast %struct._response_get_ewma_datatype* %11 to i8*, !dbg !339
  call void @llvm.var.annotation(i8* %17, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 296), !dbg !339
  call void @tag_write(%struct._tag* %9, i32 2, i32 2, i32 4), !dbg !340
  %18 = load double, double* %5, align 8, !dbg !341
  %19 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %10, i32 0, i32 0, !dbg !342
  store double %18, double* %19, align 1, !dbg !343
  %20 = load i32, i32* @_rpc_get_ewma.inited, align 4, !dbg !344
  %21 = icmp ne i32 %20, 0, !dbg !344
  br i1 %21, label %40, label %22, !dbg !346

22:                                               ; preds = %3
  store i32 1, i32* @_rpc_get_ewma.inited, align 4, !dbg !347
  %23 = call i8* @xdc_pub_socket(), !dbg !349
  store i8* %23, i8** @_rpc_get_ewma.psocket, align 8, !dbg !350
  %24 = bitcast { i64, i32 }* %12 to i8*, !dbg !351
  %25 = bitcast %struct._tag* %9 to i8*, !dbg !351
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %24, i8* align 1 %25, i64 12, i1 false), !dbg !351
  %26 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %12, i32 0, i32 0, !dbg !351
  %27 = load i64, i64* %26, align 1, !dbg !351
  %28 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %12, i32 0, i32 1, !dbg !351
  %29 = load i32, i32* %28, align 1, !dbg !351
  %30 = call i8* @xdc_sub_socket_non_blocking(i64 %27, i32 %29, i32 1000), !dbg !351
  store i8* %30, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !352
  %31 = call i32 @sleep(i32 1), !dbg !353
  call void @llvm.dbg.declare(metadata i32* %13, metadata !354, metadata !DIExpression()), !dbg !355
  %32 = load i8*, i8** @_rpc_get_ewma.psocket, align 8, !dbg !356
  %33 = load i8*, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !357
  %34 = call i32 @_rpc_get_ewma_sync_request_counter(i32* @_rpc_get_ewma.request_counter, i8* %32, i8* %33, %struct._tag* %8, %struct._tag* %9), !dbg !358
  store i32 %34, i32* %13, align 4, !dbg !355
  %35 = load i32, i32* %13, align 4, !dbg !359
  %36 = icmp eq i32 %35, 0, !dbg !361
  br i1 %36, label %37, label %39, !dbg !362

37:                                               ; preds = %22
  %38 = load i32*, i32** %6, align 8, !dbg !363
  store i32 1, i32* %38, align 4, !dbg !365
  store double 0.000000e+00, double* %4, align 8, !dbg !366
  br label %60, !dbg !366

39:                                               ; preds = %22
  br label %40, !dbg !367

40:                                               ; preds = %39, %3
  %41 = load i32, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !368
  %42 = add nsw i32 %41, 1, !dbg !368
  store i32 %42, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !368
  %43 = load i8*, i8** @_rpc_get_ewma.psocket, align 8, !dbg !369
  %44 = bitcast %struct._request_get_ewma_datatype* %10 to i8*, !dbg !370
  call void @xdc_asyn_send(i8* %43, i8* %44, %struct._tag* %8), !dbg !371
  call void @llvm.dbg.declare(metadata double* %14, metadata !372, metadata !DIExpression()), !dbg !373
  call void @llvm.dbg.declare(metadata i32* %15, metadata !374, metadata !DIExpression()), !dbg !375
  %45 = load i32, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !376
  %46 = load i8*, i8** @_rpc_get_ewma.psocket, align 8, !dbg !377
  %47 = load i8*, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !378
  %48 = call i32 @_rpc_get_ewma_remote_call(i32 %45, double* %14, i8* %46, i8* %47, %struct._tag* %8, %struct._tag* %9), !dbg !379
  store i32 %48, i32* %15, align 4, !dbg !375
  %49 = load i32, i32* %15, align 4, !dbg !380
  %50 = icmp eq i32 %49, 0, !dbg !382
  br i1 %50, label %51, label %53, !dbg !383

51:                                               ; preds = %40
  %52 = load i32*, i32** %6, align 8, !dbg !384
  store i32 1, i32* %52, align 4, !dbg !386
  store double 0.000000e+00, double* %4, align 8, !dbg !387
  br label %60, !dbg !387

53:                                               ; preds = %40
  %54 = load i32, i32* %15, align 4, !dbg !388
  %55 = icmp eq i32 %54, 2, !dbg !390
  br i1 %55, label %56, label %58, !dbg !391

56:                                               ; preds = %53
  %57 = load i32*, i32** %7, align 8, !dbg !392
  store i32 1, i32* %57, align 4, !dbg !394
  br label %58, !dbg !395

58:                                               ; preds = %56, %53
  %59 = load double, double* %14, align 8, !dbg !396
  store double %59, double* %4, align 8, !dbg !397
  br label %60, !dbg !397

60:                                               ; preds = %58, %51, %37
  %61 = load double, double* %4, align 8, !dbg !398
  ret double %61, !dbg !398
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_master_rpc_init() #0 !dbg !399 {
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0)), !dbg !402
  ret void, !dbg !403
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!51, !52, !53}
!llvm.ident = !{!54}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "inited", scope: !2, file: !3, line: 130, type: !43, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "_notify_next_tag", scope: !3, file: !3, line: 117, type: !4, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
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
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !20, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !27, globals: !30, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "partitioned/multithreaded/orange/orange_rpc.c", directory: "/workspaces/build/apps/examples/example2")
!21 = !{!22}
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "STATUS", file: !3, line: 186, baseType: !16, size: 32, elements: !23)
!23 = !{!24, !25, !26}
!24 = !DIEnumerator(name: "FAILED", value: 0, isUnsigned: true)
!25 = !DIEnumerator(name: "OK", value: 1, isUnsigned: true)
!26 = !DIEnumerator(name: "RESTARTED", value: 2, isUnsigned: true)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!0, !31, !34, !36, !45, !47, !49}
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "psocket", scope: !2, file: !3, line: 131, type: !33, isLocal: true, isDefinition: true)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "ssocket", scope: !2, file: !3, line: 132, type: !33, isLocal: true, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "inited", scope: !38, file: !3, line: 277, type: !43, isLocal: true, isDefinition: true)
!38 = distinct !DISubprogram(name: "_rpc_get_ewma", scope: !3, file: !3, line: 264, type: !39, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!39 = !DISubroutineType(types: !40)
!40 = !{!41, !41, !42, !42}
!41 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !{}
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(name: "psocket", scope: !38, file: !3, line: 278, type: !33, isLocal: true, isDefinition: true)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "ssocket", scope: !38, file: !3, line: 279, type: !33, isLocal: true, isDefinition: true)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(name: "request_counter", scope: !38, file: !3, line: 280, type: !43, isLocal: true, isDefinition: true)
!51 = !{i32 7, !"Dwarf Version", i32 4}
!52 = !{i32 2, !"Debug Info Version", i32 3}
!53 = !{i32 1, !"wchar_size", i32 4}
!54 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!55 = distinct !DISubprogram(name: "_hal_init", scope: !3, file: !3, line: 106, type: !56, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!56 = !DISubroutineType(types: !57)
!57 = !{null, !28, !28}
!58 = !DILocalVariable(name: "inuri", arg: 1, scope: !55, file: !3, line: 106, type: !28)
!59 = !DILocation(line: 106, column: 22, scope: !55)
!60 = !DILocalVariable(name: "outuri", arg: 2, scope: !55, file: !3, line: 106, type: !28)
!61 = !DILocation(line: 106, column: 35, scope: !55)
!62 = !DILocation(line: 108, column: 16, scope: !55)
!63 = !DILocation(line: 108, column: 5, scope: !55)
!64 = !DILocation(line: 109, column: 17, scope: !55)
!65 = !DILocation(line: 109, column: 5, scope: !55)
!66 = !DILocation(line: 110, column: 5, scope: !55)
!67 = !DILocation(line: 111, column: 5, scope: !55)
!68 = !DILocation(line: 112, column: 5, scope: !55)
!69 = !DILocation(line: 113, column: 5, scope: !55)
!70 = !DILocation(line: 115, column: 1, scope: !55)
!71 = !DILocalVariable(name: "n_tag", arg: 1, scope: !2, file: !3, line: 117, type: !6)
!72 = !DILocation(line: 117, column: 33, scope: !2)
!73 = !DILocalVariable(name: "t_tag", scope: !2, file: !3, line: 133, type: !7)
!74 = !DILocation(line: 133, column: 14, scope: !2)
!75 = !DILocalVariable(name: "o_tag", scope: !2, file: !3, line: 134, type: !7)
!76 = !DILocation(line: 134, column: 14, scope: !2)
!77 = !DILocalVariable(name: "nxt", scope: !2, file: !3, line: 138, type: !78)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "nextrpc_datatype", file: !79, line: 39, baseType: !80)
!79 = !DIFile(filename: "./partitioned/multithreaded/autogen/codec.h", directory: "/workspaces/build/apps/examples/example2")
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_nextrpc_datatype", file: !79, line: 34, size: 224, elements: !81)
!81 = !{!82, !86, !87, !88}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "mux", scope: !80, file: !79, line: 35, baseType: !83, size: 32)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !84, line: 26, baseType: !85)
!84 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !15, line: 41, baseType: !43)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sec", scope: !80, file: !79, line: 36, baseType: !83, size: 32, offset: 32)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "typ", scope: !80, file: !79, line: 37, baseType: !83, size: 32, offset: 64)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !80, file: !79, line: 38, baseType: !89, size: 128, offset: 96)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "trailer_datatype", file: !79, line: 24, baseType: !90)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_trailer_datatype", file: !79, line: 18, size: 128, elements: !91)
!91 = !{!92, !93, !94, !95, !99}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !90, file: !79, line: 19, baseType: !12, size: 32)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "rqr", scope: !90, file: !79, line: 20, baseType: !12, size: 32, offset: 32)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "oid", scope: !90, file: !79, line: 21, baseType: !12, size: 32, offset: 64)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "mid", scope: !90, file: !79, line: 22, baseType: !96, size: 16, offset: 96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !13, line: 25, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !15, line: 40, baseType: !98)
!98 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "crc", scope: !90, file: !79, line: 23, baseType: !96, size: 16, offset: 112)
!100 = !DILocation(line: 138, column: 22, scope: !2)
!101 = !DILocation(line: 138, column: 5, scope: !2)
!102 = !DILocation(line: 144, column: 5, scope: !2)
!103 = !DILocalVariable(name: "okay", scope: !2, file: !3, line: 148, type: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "okay_datatype", file: !79, line: 51, baseType: !105)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_okay_datatype", file: !79, line: 48, size: 160, elements: !106)
!106 = !{!107, !108}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !105, file: !79, line: 49, baseType: !83, size: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !105, file: !79, line: 50, baseType: !89, size: 128, offset: 32)
!109 = !DILocation(line: 148, column: 19, scope: !2)
!110 = !DILocation(line: 148, column: 5, scope: !2)
!111 = !DILocation(line: 154, column: 5, scope: !2)
!112 = !DILocation(line: 162, column: 10, scope: !113)
!113 = distinct !DILexicalBlock(scope: !2, file: !3, line: 162, column: 9)
!114 = !DILocation(line: 162, column: 9, scope: !2)
!115 = !DILocation(line: 163, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !3, line: 162, column: 18)
!117 = !DILocation(line: 164, column: 19, scope: !116)
!118 = !DILocation(line: 164, column: 17, scope: !116)
!119 = !DILocation(line: 165, column: 19, scope: !116)
!120 = !DILocation(line: 165, column: 17, scope: !116)
!121 = !DILocation(line: 166, column: 9, scope: !116)
!122 = !DILocation(line: 167, column: 5, scope: !116)
!123 = !DILocation(line: 169, column: 15, scope: !2)
!124 = !DILocation(line: 169, column: 22, scope: !2)
!125 = !DILocation(line: 169, column: 9, scope: !2)
!126 = !DILocation(line: 169, column: 13, scope: !2)
!127 = !DILocation(line: 170, column: 15, scope: !2)
!128 = !DILocation(line: 170, column: 22, scope: !2)
!129 = !DILocation(line: 170, column: 9, scope: !2)
!130 = !DILocation(line: 170, column: 13, scope: !2)
!131 = !DILocation(line: 171, column: 15, scope: !2)
!132 = !DILocation(line: 171, column: 22, scope: !2)
!133 = !DILocation(line: 171, column: 9, scope: !2)
!134 = !DILocation(line: 171, column: 13, scope: !2)
!135 = !DILocation(line: 179, column: 19, scope: !2)
!136 = !DILocation(line: 179, column: 28, scope: !2)
!137 = !DILocation(line: 179, column: 5, scope: !2)
!138 = !DILocation(line: 180, column: 23, scope: !2)
!139 = !DILocation(line: 180, column: 32, scope: !2)
!140 = !DILocation(line: 180, column: 5, scope: !2)
!141 = !DILocation(line: 183, column: 1, scope: !2)
!142 = distinct !DISubprogram(name: "_rpc_get_ewma_sync_request_counter", scope: !3, file: !3, line: 191, type: !143, scopeLine: 191, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!143 = !DISubroutineType(types: !144)
!144 = !{!22, !42, !33, !33, !6, !6}
!145 = !DILocalVariable(name: "request_counter", arg: 1, scope: !142, file: !3, line: 191, type: !42)
!146 = !DILocation(line: 191, column: 53, scope: !142)
!147 = !DILocalVariable(name: "psocket", arg: 2, scope: !142, file: !3, line: 191, type: !33)
!148 = !DILocation(line: 191, column: 76, scope: !142)
!149 = !DILocalVariable(name: "ssocket", arg: 3, scope: !142, file: !3, line: 191, type: !33)
!150 = !DILocation(line: 191, column: 91, scope: !142)
!151 = !DILocalVariable(name: "t_tag", arg: 4, scope: !142, file: !3, line: 191, type: !6)
!152 = !DILocation(line: 191, column: 110, scope: !142)
!153 = !DILocalVariable(name: "o_tag", arg: 5, scope: !142, file: !3, line: 191, type: !6)
!154 = !DILocation(line: 191, column: 127, scope: !142)
!155 = !DILocalVariable(name: "tries_remaining", scope: !142, file: !3, line: 192, type: !43)
!156 = !DILocation(line: 192, column: 9, scope: !142)
!157 = !DILocation(line: 193, column: 5, scope: !142)
!158 = !DILocation(line: 193, column: 11, scope: !142)
!159 = !DILocation(line: 193, column: 27, scope: !142)
!160 = !DILocalVariable(name: "req_get_ewma", scope: !161, file: !3, line: 196, type: !162)
!161 = distinct !DILexicalBlock(scope: !142, file: !3, line: 193, column: 32)
!162 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_ewma_datatype", file: !79, line: 61, baseType: !163)
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_ewma_datatype", file: !79, line: 58, size: 192, elements: !164)
!164 = !{!165, !166}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !163, file: !79, line: 59, baseType: !41, size: 64)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !163, file: !79, line: 60, baseType: !89, size: 128, offset: 64)
!167 = !DILocation(line: 196, column: 35, scope: !161)
!168 = !DILocation(line: 196, column: 9, scope: !161)
!169 = !DILocalVariable(name: "res_get_ewma", scope: !161, file: !3, line: 202, type: !170)
!170 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_ewma_datatype", file: !79, line: 71, baseType: !171)
!171 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_ewma_datatype", file: !79, line: 68, size: 192, elements: !172)
!172 = !{!173, !174}
!173 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !171, file: !79, line: 69, baseType: !41, size: 64)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !171, file: !79, line: 70, baseType: !89, size: 128, offset: 64)
!175 = !DILocation(line: 202, column: 36, scope: !161)
!176 = !DILocation(line: 202, column: 9, scope: !161)
!177 = !DILocation(line: 206, column: 37, scope: !161)
!178 = !DILocation(line: 206, column: 36, scope: !161)
!179 = !DILocation(line: 206, column: 22, scope: !161)
!180 = !DILocation(line: 206, column: 30, scope: !161)
!181 = !DILocation(line: 206, column: 34, scope: !161)
!182 = !DILocation(line: 207, column: 23, scope: !161)
!183 = !DILocation(line: 207, column: 32, scope: !161)
!184 = !DILocation(line: 207, column: 47, scope: !161)
!185 = !DILocation(line: 207, column: 9, scope: !161)
!186 = !DILocalVariable(name: "status", scope: !161, file: !3, line: 208, type: !43)
!187 = !DILocation(line: 208, column: 13, scope: !161)
!188 = !DILocation(line: 208, column: 31, scope: !161)
!189 = !DILocation(line: 208, column: 40, scope: !161)
!190 = !DILocation(line: 208, column: 55, scope: !161)
!191 = !DILocation(line: 208, column: 22, scope: !161)
!192 = !DILocalVariable(name: "respId", scope: !161, file: !3, line: 209, type: !43)
!193 = !DILocation(line: 209, column: 13, scope: !161)
!194 = !DILocation(line: 209, column: 35, scope: !161)
!195 = !DILocation(line: 209, column: 43, scope: !161)
!196 = !DILocation(line: 209, column: 47, scope: !161)
!197 = !DILocalVariable(name: "error", scope: !161, file: !3, line: 210, type: !198)
!198 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!199 = !DILocation(line: 210, column: 14, scope: !161)
!200 = !DILocation(line: 210, column: 36, scope: !161)
!201 = !DILocation(line: 210, column: 44, scope: !161)
!202 = !DILocation(line: 210, column: 48, scope: !161)
!203 = !DILocation(line: 210, column: 53, scope: !161)
!204 = !DILocation(line: 210, column: 22, scope: !161)
!205 = !DILocalVariable(name: "callee_restarted", scope: !161, file: !3, line: 211, type: !198)
!206 = !DILocation(line: 211, column: 14, scope: !161)
!207 = !DILocation(line: 211, column: 46, scope: !161)
!208 = !DILocation(line: 211, column: 54, scope: !161)
!209 = !DILocation(line: 211, column: 58, scope: !161)
!210 = !DILocation(line: 211, column: 33, scope: !161)
!211 = !DILocation(line: 212, column: 12, scope: !212)
!212 = distinct !DILexicalBlock(scope: !161, file: !3, line: 212, column: 12)
!213 = !DILocation(line: 212, column: 19, scope: !212)
!214 = !DILocation(line: 212, column: 12, scope: !161)
!215 = !DILocation(line: 213, column: 28, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !3, line: 212, column: 30)
!217 = !DILocation(line: 214, column: 9, scope: !216)
!218 = !DILocation(line: 216, column: 32, scope: !219)
!219 = distinct !DILexicalBlock(scope: !212, file: !3, line: 215, column: 13)
!220 = !DILocation(line: 216, column: 14, scope: !219)
!221 = !DILocation(line: 216, column: 30, scope: !219)
!222 = !DILocation(line: 217, column: 13, scope: !219)
!223 = distinct !{!223, !157, !224}
!224 = !DILocation(line: 219, column: 5, scope: !142)
!225 = !DILocation(line: 220, column: 5, scope: !142)
!226 = !DILocation(line: 221, column: 1, scope: !142)
!227 = distinct !DISubprogram(name: "_rpc_get_ewma_remote_call", scope: !3, file: !3, line: 223, type: !228, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!228 = !DISubroutineType(types: !229)
!229 = !{!22, !43, !230, !33, !33, !6, !6}
!230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!231 = !DILocalVariable(name: "reqId", arg: 1, scope: !227, file: !3, line: 223, type: !43)
!232 = !DILocation(line: 223, column: 43, scope: !227)
!233 = !DILocalVariable(name: "result", arg: 2, scope: !227, file: !3, line: 223, type: !230)
!234 = !DILocation(line: 223, column: 58, scope: !227)
!235 = !DILocalVariable(name: "psocket", arg: 3, scope: !227, file: !3, line: 223, type: !33)
!236 = !DILocation(line: 223, column: 72, scope: !227)
!237 = !DILocalVariable(name: "ssocket", arg: 4, scope: !227, file: !3, line: 223, type: !33)
!238 = !DILocation(line: 223, column: 87, scope: !227)
!239 = !DILocalVariable(name: "t_tag", arg: 5, scope: !227, file: !3, line: 223, type: !6)
!240 = !DILocation(line: 223, column: 106, scope: !227)
!241 = !DILocalVariable(name: "o_tag", arg: 6, scope: !227, file: !3, line: 223, type: !6)
!242 = !DILocation(line: 223, column: 123, scope: !227)
!243 = !DILocalVariable(name: "tries_remaining", scope: !227, file: !3, line: 224, type: !43)
!244 = !DILocation(line: 224, column: 9, scope: !227)
!245 = !DILocation(line: 225, column: 5, scope: !227)
!246 = !DILocation(line: 225, column: 11, scope: !227)
!247 = !DILocation(line: 225, column: 26, scope: !227)
!248 = !DILocalVariable(name: "req_get_ewma", scope: !249, file: !3, line: 228, type: !162)
!249 = distinct !DILexicalBlock(scope: !227, file: !3, line: 225, column: 30)
!250 = !DILocation(line: 228, column: 35, scope: !249)
!251 = !DILocation(line: 228, column: 9, scope: !249)
!252 = !DILocalVariable(name: "res_get_ewma", scope: !249, file: !3, line: 234, type: !170)
!253 = !DILocation(line: 234, column: 36, scope: !249)
!254 = !DILocation(line: 234, column: 9, scope: !249)
!255 = !DILocation(line: 238, column: 36, scope: !249)
!256 = !DILocation(line: 238, column: 22, scope: !249)
!257 = !DILocation(line: 238, column: 30, scope: !249)
!258 = !DILocation(line: 238, column: 34, scope: !249)
!259 = !DILocation(line: 239, column: 23, scope: !249)
!260 = !DILocation(line: 239, column: 32, scope: !249)
!261 = !DILocation(line: 239, column: 47, scope: !249)
!262 = !DILocation(line: 239, column: 9, scope: !249)
!263 = !DILocalVariable(name: "status", scope: !249, file: !3, line: 240, type: !43)
!264 = !DILocation(line: 240, column: 13, scope: !249)
!265 = !DILocation(line: 240, column: 31, scope: !249)
!266 = !DILocation(line: 240, column: 40, scope: !249)
!267 = !DILocation(line: 240, column: 55, scope: !249)
!268 = !DILocation(line: 240, column: 22, scope: !249)
!269 = !DILocalVariable(name: "respId", scope: !249, file: !3, line: 241, type: !43)
!270 = !DILocation(line: 241, column: 13, scope: !249)
!271 = !DILocation(line: 241, column: 35, scope: !249)
!272 = !DILocation(line: 241, column: 43, scope: !249)
!273 = !DILocation(line: 241, column: 47, scope: !249)
!274 = !DILocalVariable(name: "error", scope: !249, file: !3, line: 242, type: !198)
!275 = !DILocation(line: 242, column: 14, scope: !249)
!276 = !DILocation(line: 242, column: 36, scope: !249)
!277 = !DILocation(line: 242, column: 44, scope: !249)
!278 = !DILocation(line: 242, column: 48, scope: !249)
!279 = !DILocation(line: 242, column: 53, scope: !249)
!280 = !DILocation(line: 242, column: 22, scope: !249)
!281 = !DILocalVariable(name: "callee_restarted", scope: !249, file: !3, line: 243, type: !198)
!282 = !DILocation(line: 243, column: 14, scope: !249)
!283 = !DILocation(line: 243, column: 46, scope: !249)
!284 = !DILocation(line: 243, column: 54, scope: !249)
!285 = !DILocation(line: 243, column: 58, scope: !249)
!286 = !DILocation(line: 243, column: 33, scope: !249)
!287 = !DILocation(line: 244, column: 12, scope: !288)
!288 = distinct !DILexicalBlock(scope: !249, file: !3, line: 244, column: 12)
!289 = !DILocation(line: 244, column: 19, scope: !288)
!290 = !DILocation(line: 244, column: 12, scope: !249)
!291 = !DILocation(line: 245, column: 28, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !3, line: 244, column: 30)
!293 = !DILocation(line: 246, column: 9, scope: !292)
!294 = !DILocation(line: 248, column: 16, scope: !295)
!295 = distinct !DILexicalBlock(scope: !296, file: !3, line: 248, column: 16)
!296 = distinct !DILexicalBlock(scope: !288, file: !3, line: 247, column: 13)
!297 = !DILocation(line: 248, column: 25, scope: !295)
!298 = !DILocation(line: 248, column: 23, scope: !295)
!299 = !DILocation(line: 248, column: 16, scope: !296)
!300 = !DILocation(line: 249, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !295, file: !3, line: 248, column: 31)
!302 = distinct !{!302, !245, !303}
!303 = !DILocation(line: 261, column: 5, scope: !227)
!304 = !DILocation(line: 251, column: 16, scope: !305)
!305 = distinct !DILexicalBlock(scope: !296, file: !3, line: 251, column: 16)
!306 = !DILocation(line: 251, column: 16, scope: !296)
!307 = !DILocation(line: 252, column: 17, scope: !308)
!308 = distinct !DILexicalBlock(scope: !305, file: !3, line: 251, column: 22)
!309 = !DILocation(line: 254, column: 16, scope: !310)
!310 = distinct !DILexicalBlock(scope: !296, file: !3, line: 254, column: 16)
!311 = !DILocation(line: 254, column: 16, scope: !296)
!312 = !DILocation(line: 255, column: 40, scope: !313)
!313 = distinct !DILexicalBlock(scope: !310, file: !3, line: 254, column: 33)
!314 = !DILocation(line: 255, column: 18, scope: !313)
!315 = !DILocation(line: 255, column: 25, scope: !313)
!316 = !DILocation(line: 256, column: 17, scope: !313)
!317 = !DILocation(line: 258, column: 36, scope: !296)
!318 = !DILocation(line: 258, column: 14, scope: !296)
!319 = !DILocation(line: 258, column: 21, scope: !296)
!320 = !DILocation(line: 259, column: 13, scope: !296)
!321 = !DILocation(line: 262, column: 5, scope: !227)
!322 = !DILocation(line: 263, column: 1, scope: !227)
!323 = !DILocalVariable(name: "x", arg: 1, scope: !38, file: !3, line: 264, type: !41)
!324 = !DILocation(line: 264, column: 29, scope: !38)
!325 = !DILocalVariable(name: "error", arg: 2, scope: !38, file: !3, line: 264, type: !42)
!326 = !DILocation(line: 264, column: 37, scope: !38)
!327 = !DILocalVariable(name: "restarted", arg: 3, scope: !38, file: !3, line: 264, type: !42)
!328 = !DILocation(line: 264, column: 49, scope: !38)
!329 = !DILocalVariable(name: "t_tag", scope: !38, file: !3, line: 281, type: !7)
!330 = !DILocation(line: 281, column: 14, scope: !38)
!331 = !DILocalVariable(name: "o_tag", scope: !38, file: !3, line: 282, type: !7)
!332 = !DILocation(line: 282, column: 14, scope: !38)
!333 = !DILocalVariable(name: "req_get_ewma", scope: !38, file: !3, line: 286, type: !162)
!334 = !DILocation(line: 286, column: 31, scope: !38)
!335 = !DILocation(line: 286, column: 5, scope: !38)
!336 = !DILocation(line: 292, column: 5, scope: !38)
!337 = !DILocalVariable(name: "res_get_ewma", scope: !38, file: !3, line: 296, type: !170)
!338 = !DILocation(line: 296, column: 32, scope: !38)
!339 = !DILocation(line: 296, column: 5, scope: !38)
!340 = !DILocation(line: 302, column: 5, scope: !38)
!341 = !DILocation(line: 304, column: 22, scope: !38)
!342 = !DILocation(line: 304, column: 18, scope: !38)
!343 = !DILocation(line: 304, column: 20, scope: !38)
!344 = !DILocation(line: 311, column: 10, scope: !345)
!345 = distinct !DILexicalBlock(scope: !38, file: !3, line: 311, column: 9)
!346 = !DILocation(line: 311, column: 9, scope: !38)
!347 = !DILocation(line: 312, column: 16, scope: !348)
!348 = distinct !DILexicalBlock(scope: !345, file: !3, line: 311, column: 18)
!349 = !DILocation(line: 313, column: 19, scope: !348)
!350 = !DILocation(line: 313, column: 17, scope: !348)
!351 = !DILocation(line: 314, column: 19, scope: !348)
!352 = !DILocation(line: 314, column: 17, scope: !348)
!353 = !DILocation(line: 315, column: 9, scope: !348)
!354 = !DILocalVariable(name: "status", scope: !348, file: !3, line: 316, type: !43)
!355 = !DILocation(line: 316, column: 13, scope: !348)
!356 = !DILocation(line: 316, column: 75, scope: !348)
!357 = !DILocation(line: 316, column: 84, scope: !348)
!358 = !DILocation(line: 316, column: 22, scope: !348)
!359 = !DILocation(line: 317, column: 12, scope: !360)
!360 = distinct !DILexicalBlock(scope: !348, file: !3, line: 317, column: 12)
!361 = !DILocation(line: 317, column: 19, scope: !360)
!362 = !DILocation(line: 317, column: 12, scope: !348)
!363 = !DILocation(line: 318, column: 14, scope: !364)
!364 = distinct !DILexicalBlock(scope: !360, file: !3, line: 317, column: 29)
!365 = !DILocation(line: 318, column: 20, scope: !364)
!366 = !DILocation(line: 319, column: 13, scope: !364)
!367 = !DILocation(line: 321, column: 5, scope: !348)
!368 = !DILocation(line: 322, column: 20, scope: !38)
!369 = !DILocation(line: 333, column: 19, scope: !38)
!370 = !DILocation(line: 333, column: 28, scope: !38)
!371 = !DILocation(line: 333, column: 5, scope: !38)
!372 = !DILocalVariable(name: "result", scope: !38, file: !3, line: 335, type: !41)
!373 = !DILocation(line: 335, column: 12, scope: !38)
!374 = !DILocalVariable(name: "status", scope: !38, file: !3, line: 336, type: !22)
!375 = !DILocation(line: 336, column: 17, scope: !38)
!376 = !DILocation(line: 336, column: 52, scope: !38)
!377 = !DILocation(line: 336, column: 79, scope: !38)
!378 = !DILocation(line: 336, column: 88, scope: !38)
!379 = !DILocation(line: 336, column: 26, scope: !38)
!380 = !DILocation(line: 337, column: 8, scope: !381)
!381 = distinct !DILexicalBlock(scope: !38, file: !3, line: 337, column: 8)
!382 = !DILocation(line: 337, column: 15, scope: !381)
!383 = !DILocation(line: 337, column: 8, scope: !38)
!384 = !DILocation(line: 338, column: 10, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !3, line: 337, column: 25)
!386 = !DILocation(line: 338, column: 16, scope: !385)
!387 = !DILocation(line: 339, column: 9, scope: !385)
!388 = !DILocation(line: 341, column: 8, scope: !389)
!389 = distinct !DILexicalBlock(scope: !38, file: !3, line: 341, column: 8)
!390 = !DILocation(line: 341, column: 15, scope: !389)
!391 = !DILocation(line: 341, column: 8, scope: !38)
!392 = !DILocation(line: 342, column: 10, scope: !393)
!393 = distinct !DILexicalBlock(scope: !389, file: !3, line: 341, column: 28)
!394 = !DILocation(line: 342, column: 20, scope: !393)
!395 = !DILocation(line: 343, column: 5, scope: !393)
!396 = !DILocation(line: 347, column: 13, scope: !38)
!397 = !DILocation(line: 347, column: 5, scope: !38)
!398 = !DILocation(line: 351, column: 1, scope: !38)
!399 = distinct !DISubprogram(name: "_master_rpc_init", scope: !3, file: !3, line: 353, type: !400, scopeLine: 353, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!400 = !DISubroutineType(types: !401)
!401 = !{null}
!402 = !DILocation(line: 354, column: 5, scope: !399)
!403 = !DILocation(line: 355, column: 1, scope: !399)