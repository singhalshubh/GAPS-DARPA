; ModuleID = './partitioned/multithreaded/purple/purple_rpc.c'
source_filename = "./partitioned/multithreaded/purple/purple_rpc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._tag = type { i32, i32, i32 }
%struct._nextrpc_datatype = type { i32, i32, i32, %struct._trailer_datatype }
%struct._trailer_datatype = type { i32, i32, i32, i16, i16 }
%struct._okay_datatype = type { i32, %struct._trailer_datatype }
%struct._request_get_a_datatype = type { i32, %struct._trailer_datatype }
%struct._response_get_a_datatype = type { double, %struct._trailer_datatype }

@_notify_next_tag.inited = internal global i32 0, align 4, !dbg !0
@_notify_next_tag.psocket = internal global i8* null, align 8, !dbg !31
@_notify_next_tag.ssocket = internal global i8* null, align 8, !dbg !34
@.str = private unnamed_addr constant [12 x i8] c"TAG_NEXTRPC\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [48 x i8] c"./partitioned/multithreaded/purple/purple_rpc.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [9 x i8] c"TAG_OKAY\00", section "llvm.metadata"
@_rpc_get_a.inited = internal global i32 0, align 4, !dbg !36
@_rpc_get_a.psocket = internal global i8* null, align 8, !dbg !45
@_rpc_get_a.ssocket = internal global i8* null, align 8, !dbg !47
@_rpc_get_a.request_counter = internal global i32 -2147483648, align 4, !dbg !49
@.str.3 = private unnamed_addr constant [18 x i8] c"TAG_REQUEST_GET_A\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [19 x i8] c"TAG_RESPONSE_GET_A\00", section "llvm.metadata"
@.str.5 = private unnamed_addr constant [17 x i8] c"SERVER RESTARTED\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_subpurple\00", align 1
@.str.7 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_pubpurple\00", align 1

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
  call void @xdc_register(void (i8*, i8*, i64*)* @request_get_a_data_encode, void (i8*, i8*, i64*)* @request_get_a_data_decode, i32 3), !dbg !68
  call void @xdc_register(void (i8*, i8*, i64*)* @response_get_a_data_encode, void (i8*, i8*, i64*)* @response_get_a_data_decode, i32 4), !dbg !69
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

declare dso_local void @request_get_a_data_encode(i8*, i8*, i64*) #2

declare dso_local void @request_get_a_data_decode(i8*, i8*, i64*) #2

declare dso_local void @response_get_a_data_encode(i8*, i8*, i64*) #2

declare dso_local void @response_get_a_data_decode(i8*, i8*, i64*) #2

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
  call void @llvm.var.annotation(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 139), !dbg !101
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 1), !dbg !102
  call void @llvm.dbg.declare(metadata %struct._okay_datatype* %6, metadata !103, metadata !DIExpression()), !dbg !109
  %9 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !110
  call void @llvm.var.annotation(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 149), !dbg !110
  call void @tag_write(%struct._tag* %4, i32 1, i32 1, i32 2), !dbg !111
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
  %20 = call i8* @xdc_sub_socket(i64 %17, i32 %19), !dbg !119
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

declare dso_local i8* @xdc_sub_socket(i64, i32) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local i32 @sleep(i32) #2

declare dso_local void @xdc_asyn_send(i8*, i8*, %struct._tag*) #2

declare dso_local void @xdc_blocking_recv(i8*, i8*, %struct._tag*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_rpc_get_a_sync_request_counter(i32* %0, i8* %1, i8* %2, %struct._tag* %3, %struct._tag* %4) #0 !dbg !142 {
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca %struct._tag*, align 8
  %11 = alloca %struct._tag*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct._request_get_a_datatype, align 1
  %14 = alloca %struct._response_get_a_datatype, align 1
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
  store i32 30, i32* %12, align 4, !dbg !156
  br label %19, !dbg !157

19:                                               ; preds = %60, %5
  %20 = load i32, i32* %12, align 4, !dbg !158
  %21 = icmp ne i32 %20, 0, !dbg !159
  br i1 %21, label %22, label %61, !dbg !157

22:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %13, metadata !160, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %14, metadata !168, metadata !DIExpression()), !dbg !174
  %23 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %13, i32 0, i32 0, !dbg !175
  store i32 0, i32* %23, align 1, !dbg !176
  %24 = load i32*, i32** %7, align 8, !dbg !177
  %25 = load i32, i32* %24, align 4, !dbg !178
  %26 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %13, i32 0, i32 1, !dbg !179
  %27 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %26, i32 0, i32 0, !dbg !180
  store i32 %25, i32* %27, align 1, !dbg !181
  %28 = load i8*, i8** %8, align 8, !dbg !182
  %29 = bitcast %struct._request_get_a_datatype* %13 to i8*, !dbg !183
  %30 = load %struct._tag*, %struct._tag** %10, align 8, !dbg !184
  call void @xdc_asyn_send(i8* %28, i8* %29, %struct._tag* %30), !dbg !185
  call void @llvm.dbg.declare(metadata i32* %15, metadata !186, metadata !DIExpression()), !dbg !187
  %31 = load i8*, i8** %9, align 8, !dbg !188
  %32 = bitcast %struct._response_get_a_datatype* %14 to i8*, !dbg !189
  %33 = load %struct._tag*, %struct._tag** %11, align 8, !dbg !190
  %34 = call i32 @xdc_recv(i8* %31, i8* %32, %struct._tag* %33), !dbg !191
  store i32 %34, i32* %15, align 4, !dbg !187
  call void @llvm.dbg.declare(metadata i32* %16, metadata !192, metadata !DIExpression()), !dbg !193
  %35 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %14, i32 0, i32 1, !dbg !194
  %36 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %35, i32 0, i32 0, !dbg !195
  %37 = load i32, i32* %36, align 1, !dbg !195
  %38 = lshr i32 %37, 2, !dbg !196
  store i32 %38, i32* %16, align 4, !dbg !193
  call void @llvm.dbg.declare(metadata i8* %17, metadata !197, metadata !DIExpression()), !dbg !199
  %39 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %14, i32 0, i32 1, !dbg !200
  %40 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %39, i32 0, i32 0, !dbg !201
  %41 = load i32, i32* %40, align 1, !dbg !201
  %42 = lshr i32 %41, 1, !dbg !202
  %43 = and i32 %42, 1, !dbg !203
  %44 = icmp ne i32 %43, 0, !dbg !204
  %45 = zext i1 %44 to i8, !dbg !199
  store i8 %45, i8* %17, align 1, !dbg !199
  call void @llvm.dbg.declare(metadata i8* %18, metadata !205, metadata !DIExpression()), !dbg !206
  %46 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %14, i32 0, i32 1, !dbg !207
  %47 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %46, i32 0, i32 0, !dbg !208
  %48 = load i32, i32* %47, align 1, !dbg !208
  %49 = and i32 %48, 1, !dbg !209
  %50 = icmp ne i32 %49, 0, !dbg !210
  %51 = zext i1 %50 to i8, !dbg !206
  store i8 %51, i8* %18, align 1, !dbg !206
  %52 = load i32, i32* %15, align 4, !dbg !211
  %53 = icmp eq i32 %52, -1, !dbg !213
  br i1 %53, label %54, label %57, !dbg !214

54:                                               ; preds = %22
  %55 = load i32, i32* %12, align 4, !dbg !215
  %56 = add nsw i32 %55, -1, !dbg !215
  store i32 %56, i32* %12, align 4, !dbg !215
  br label %60, !dbg !217

57:                                               ; preds = %22
  %58 = load i32, i32* %16, align 4, !dbg !218
  %59 = load i32*, i32** %7, align 8, !dbg !220
  store i32 %58, i32* %59, align 4, !dbg !221
  store i32 1, i32* %6, align 4, !dbg !222
  br label %62, !dbg !222

60:                                               ; preds = %54
  br label %19, !dbg !157, !llvm.loop !223

61:                                               ; preds = %19
  store i32 0, i32* %6, align 4, !dbg !225
  br label %62, !dbg !225

62:                                               ; preds = %61, %57
  %63 = load i32, i32* %6, align 4, !dbg !226
  ret i32 %63, !dbg !226
}

declare dso_local i32 @xdc_recv(i8*, i8*, %struct._tag*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_rpc_get_a_remote_call(i32 %0, double* %1, i8* %2, i8* %3, %struct._tag* %4, %struct._tag* %5) #0 !dbg !227 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca %struct._tag*, align 8
  %13 = alloca %struct._tag*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct._request_get_a_datatype, align 1
  %16 = alloca %struct._response_get_a_datatype, align 1
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
  store i32 30, i32* %14, align 4, !dbg !244
  br label %21, !dbg !245

21:                                               ; preds = %78, %62, %6
  %22 = load i32, i32* %14, align 4, !dbg !246
  %23 = icmp ne i32 %22, 0, !dbg !247
  br i1 %23, label %24, label %79, !dbg !245

24:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %15, metadata !248, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %16, metadata !251, metadata !DIExpression()), !dbg !252
  %25 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %15, i32 0, i32 0, !dbg !253
  store i32 0, i32* %25, align 1, !dbg !254
  %26 = load i32, i32* %8, align 4, !dbg !255
  %27 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %15, i32 0, i32 1, !dbg !256
  %28 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %27, i32 0, i32 0, !dbg !257
  store i32 %26, i32* %28, align 1, !dbg !258
  %29 = load i8*, i8** %10, align 8, !dbg !259
  %30 = bitcast %struct._request_get_a_datatype* %15 to i8*, !dbg !260
  %31 = load %struct._tag*, %struct._tag** %12, align 8, !dbg !261
  call void @xdc_asyn_send(i8* %29, i8* %30, %struct._tag* %31), !dbg !262
  call void @llvm.dbg.declare(metadata i32* %17, metadata !263, metadata !DIExpression()), !dbg !264
  %32 = load i8*, i8** %11, align 8, !dbg !265
  %33 = bitcast %struct._response_get_a_datatype* %16 to i8*, !dbg !266
  %34 = load %struct._tag*, %struct._tag** %13, align 8, !dbg !267
  %35 = call i32 @xdc_recv(i8* %32, i8* %33, %struct._tag* %34), !dbg !268
  store i32 %35, i32* %17, align 4, !dbg !264
  call void @llvm.dbg.declare(metadata i32* %18, metadata !269, metadata !DIExpression()), !dbg !270
  %36 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %16, i32 0, i32 1, !dbg !271
  %37 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %36, i32 0, i32 0, !dbg !272
  %38 = load i32, i32* %37, align 1, !dbg !272
  %39 = lshr i32 %38, 2, !dbg !273
  store i32 %39, i32* %18, align 4, !dbg !270
  call void @llvm.dbg.declare(metadata i8* %19, metadata !274, metadata !DIExpression()), !dbg !275
  %40 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %16, i32 0, i32 1, !dbg !276
  %41 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %40, i32 0, i32 0, !dbg !277
  %42 = load i32, i32* %41, align 1, !dbg !277
  %43 = lshr i32 %42, 1, !dbg !278
  %44 = and i32 %43, 1, !dbg !279
  %45 = icmp ne i32 %44, 0, !dbg !280
  %46 = zext i1 %45 to i8, !dbg !275
  store i8 %46, i8* %19, align 1, !dbg !275
  call void @llvm.dbg.declare(metadata i8* %20, metadata !281, metadata !DIExpression()), !dbg !282
  %47 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %16, i32 0, i32 1, !dbg !283
  %48 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %47, i32 0, i32 0, !dbg !284
  %49 = load i32, i32* %48, align 1, !dbg !284
  %50 = and i32 %49, 1, !dbg !285
  %51 = icmp ne i32 %50, 0, !dbg !286
  %52 = zext i1 %51 to i8, !dbg !282
  store i8 %52, i8* %20, align 1, !dbg !282
  %53 = load i32, i32* %17, align 4, !dbg !287
  %54 = icmp eq i32 %53, -1, !dbg !289
  br i1 %54, label %55, label %58, !dbg !290

55:                                               ; preds = %24
  %56 = load i32, i32* %14, align 4, !dbg !291
  %57 = add nsw i32 %56, -1, !dbg !291
  store i32 %57, i32* %14, align 4, !dbg !291
  br label %78, !dbg !293

58:                                               ; preds = %24
  %59 = load i32, i32* %18, align 4, !dbg !294
  %60 = load i32, i32* %8, align 4, !dbg !297
  %61 = icmp slt i32 %59, %60, !dbg !298
  br i1 %61, label %62, label %63, !dbg !299

62:                                               ; preds = %58
  br label %21, !dbg !300, !llvm.loop !302

63:                                               ; preds = %58
  %64 = load i8, i8* %19, align 1, !dbg !304
  %65 = trunc i8 %64 to i1, !dbg !304
  br i1 %65, label %66, label %67, !dbg !306

66:                                               ; preds = %63
  store i32 0, i32* %7, align 4, !dbg !307
  br label %80, !dbg !307

67:                                               ; preds = %63
  %68 = load i8, i8* %20, align 1, !dbg !309
  %69 = trunc i8 %68 to i1, !dbg !309
  br i1 %69, label %70, label %74, !dbg !311

70:                                               ; preds = %67
  %71 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %16, i32 0, i32 0, !dbg !312
  %72 = load double, double* %71, align 1, !dbg !312
  %73 = load double*, double** %9, align 8, !dbg !314
  store double %72, double* %73, align 8, !dbg !315
  store i32 2, i32* %7, align 4, !dbg !316
  br label %80, !dbg !316

74:                                               ; preds = %67
  %75 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %16, i32 0, i32 0, !dbg !317
  %76 = load double, double* %75, align 1, !dbg !317
  %77 = load double*, double** %9, align 8, !dbg !318
  store double %76, double* %77, align 8, !dbg !319
  store i32 1, i32* %7, align 4, !dbg !320
  br label %80, !dbg !320

78:                                               ; preds = %55
  br label %21, !dbg !245, !llvm.loop !302

79:                                               ; preds = %21
  store i32 0, i32* %7, align 4, !dbg !321
  br label %80, !dbg !321

80:                                               ; preds = %79, %74, %70, %66
  %81 = load i32, i32* %7, align 4, !dbg !322
  ret i32 %81, !dbg !322
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @_rpc_get_a(i32* %0, i32* %1) #0 !dbg !38 {
  %3 = alloca double, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca %struct._tag, align 1
  %7 = alloca %struct._tag, align 1
  %8 = alloca %struct._request_get_a_datatype, align 1
  %9 = alloca %struct._response_get_a_datatype, align 1
  %10 = alloca { i64, i32 }, align 1
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  %13 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  call void @llvm.dbg.declare(metadata i32** %4, metadata !323, metadata !DIExpression()), !dbg !324
  store i32* %1, i32** %5, align 8
  call void @llvm.dbg.declare(metadata i32** %5, metadata !325, metadata !DIExpression()), !dbg !326
  call void @llvm.dbg.declare(metadata %struct._tag* %6, metadata !327, metadata !DIExpression()), !dbg !328
  call void @llvm.dbg.declare(metadata %struct._tag* %7, metadata !329, metadata !DIExpression()), !dbg !330
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %8, metadata !331, metadata !DIExpression()), !dbg !332
  %14 = bitcast %struct._request_get_a_datatype* %8 to i8*, !dbg !333
  call void @llvm.var.annotation(i8* %14, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 294), !dbg !333
  call void @tag_write(%struct._tag* %6, i32 2, i32 2, i32 3), !dbg !334
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %9, metadata !335, metadata !DIExpression()), !dbg !336
  %15 = bitcast %struct._response_get_a_datatype* %9 to i8*, !dbg !337
  call void @llvm.var.annotation(i8* %15, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 304), !dbg !337
  call void @tag_write(%struct._tag* %7, i32 1, i32 1, i32 4), !dbg !338
  %16 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %8, i32 0, i32 0, !dbg !339
  store i32 0, i32* %16, align 1, !dbg !340
  %17 = load i32, i32* @_rpc_get_a.inited, align 4, !dbg !341
  %18 = icmp ne i32 %17, 0, !dbg !341
  br i1 %18, label %37, label %19, !dbg !343

19:                                               ; preds = %2
  store i32 1, i32* @_rpc_get_a.inited, align 4, !dbg !344
  %20 = call i8* @xdc_pub_socket(), !dbg !346
  store i8* %20, i8** @_rpc_get_a.psocket, align 8, !dbg !347
  %21 = bitcast { i64, i32 }* %10 to i8*, !dbg !348
  %22 = bitcast %struct._tag* %7 to i8*, !dbg !348
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %21, i8* align 1 %22, i64 12, i1 false), !dbg !348
  %23 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %10, i32 0, i32 0, !dbg !348
  %24 = load i64, i64* %23, align 1, !dbg !348
  %25 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %10, i32 0, i32 1, !dbg !348
  %26 = load i32, i32* %25, align 1, !dbg !348
  %27 = call i8* @xdc_sub_socket(i64 %24, i32 %26), !dbg !348
  store i8* %27, i8** @_rpc_get_a.ssocket, align 8, !dbg !349
  %28 = call i32 @sleep(i32 1), !dbg !350
  call void @llvm.dbg.declare(metadata i32* %11, metadata !351, metadata !DIExpression()), !dbg !352
  %29 = load i8*, i8** @_rpc_get_a.psocket, align 8, !dbg !353
  %30 = load i8*, i8** @_rpc_get_a.ssocket, align 8, !dbg !354
  %31 = call i32 @_rpc_get_a_sync_request_counter(i32* @_rpc_get_a.request_counter, i8* %29, i8* %30, %struct._tag* %6, %struct._tag* %7), !dbg !355
  store i32 %31, i32* %11, align 4, !dbg !352
  %32 = load i32, i32* %11, align 4, !dbg !356
  %33 = icmp eq i32 %32, 0, !dbg !358
  br i1 %33, label %34, label %36, !dbg !359

34:                                               ; preds = %19
  %35 = load i32*, i32** %4, align 8, !dbg !360
  store i32 1, i32* %35, align 4, !dbg !362
  store double 0.000000e+00, double* %3, align 8, !dbg !363
  br label %58, !dbg !363

36:                                               ; preds = %19
  br label %37, !dbg !364

37:                                               ; preds = %36, %2
  %38 = load i32, i32* @_rpc_get_a.request_counter, align 4, !dbg !365
  %39 = add nsw i32 %38, 1, !dbg !365
  store i32 %39, i32* @_rpc_get_a.request_counter, align 4, !dbg !365
  %40 = load i8*, i8** @_rpc_get_a.psocket, align 8, !dbg !366
  %41 = bitcast %struct._request_get_a_datatype* %8 to i8*, !dbg !367
  call void @xdc_asyn_send(i8* %40, i8* %41, %struct._tag* %6), !dbg !368
  call void @llvm.dbg.declare(metadata double* %12, metadata !369, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.declare(metadata i32* %13, metadata !371, metadata !DIExpression()), !dbg !372
  %42 = load i32, i32* @_rpc_get_a.request_counter, align 4, !dbg !373
  %43 = load i8*, i8** @_rpc_get_a.psocket, align 8, !dbg !374
  %44 = load i8*, i8** @_rpc_get_a.ssocket, align 8, !dbg !375
  %45 = call i32 @_rpc_get_a_remote_call(i32 %42, double* %12, i8* %43, i8* %44, %struct._tag* %6, %struct._tag* %7), !dbg !376
  store i32 %45, i32* %13, align 4, !dbg !372
  %46 = load i32, i32* %13, align 4, !dbg !377
  %47 = icmp eq i32 %46, 0, !dbg !379
  br i1 %47, label %48, label %50, !dbg !380

48:                                               ; preds = %37
  %49 = load i32*, i32** %4, align 8, !dbg !381
  store i32 1, i32* %49, align 4, !dbg !383
  store double 0.000000e+00, double* %3, align 8, !dbg !384
  br label %58, !dbg !384

50:                                               ; preds = %37
  %51 = load i32, i32* %13, align 4, !dbg !385
  %52 = icmp eq i32 %51, 2, !dbg !387
  br i1 %52, label %53, label %56, !dbg !388

53:                                               ; preds = %50
  %54 = load i32*, i32** %5, align 8, !dbg !389
  store i32 1, i32* %54, align 4, !dbg !391
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !392
  br label %56, !dbg !393

56:                                               ; preds = %53, %50
  %57 = load double, double* %12, align 8, !dbg !394
  store double %57, double* %3, align 8, !dbg !395
  br label %58, !dbg !395

58:                                               ; preds = %56, %48, %34
  %59 = load double, double* %3, align 8, !dbg !396
  ret double %59, !dbg !396
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_master_rpc_init() #0 !dbg !397 {
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.7, i64 0, i64 0)), !dbg !400
  ret void, !dbg !401
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
!1 = distinct !DIGlobalVariable(name: "inited", scope: !2, file: !3, line: 131, type: !43, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "_notify_next_tag", scope: !3, file: !3, line: 118, type: !4, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!3 = !DIFile(filename: "./partitioned/multithreaded/purple/purple_rpc.c", directory: "/workspaces/build/apps/examples/example1")
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
!20 = !DIFile(filename: "partitioned/multithreaded/purple/purple_rpc.c", directory: "/workspaces/build/apps/examples/example1")
!21 = !{!22}
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "STATUS", file: !3, line: 189, baseType: !16, size: 32, elements: !23)
!23 = !{!24, !25, !26}
!24 = !DIEnumerator(name: "FAILED", value: 0, isUnsigned: true)
!25 = !DIEnumerator(name: "OK", value: 1, isUnsigned: true)
!26 = !DIEnumerator(name: "RESTARTED", value: 2, isUnsigned: true)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!0, !31, !34, !36, !45, !47, !49}
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "psocket", scope: !2, file: !3, line: 132, type: !33, isLocal: true, isDefinition: true)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "ssocket", scope: !2, file: !3, line: 133, type: !33, isLocal: true, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "inited", scope: !38, file: !3, line: 283, type: !43, isLocal: true, isDefinition: true)
!38 = distinct !DISubprogram(name: "_rpc_get_a", scope: !3, file: !3, line: 270, type: !39, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!39 = !DISubroutineType(types: !40)
!40 = !{!41, !42, !42}
!41 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !{}
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(name: "psocket", scope: !38, file: !3, line: 284, type: !33, isLocal: true, isDefinition: true)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "ssocket", scope: !38, file: !3, line: 285, type: !33, isLocal: true, isDefinition: true)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(name: "request_counter", scope: !38, file: !3, line: 287, type: !43, isLocal: true, isDefinition: true)
!51 = !{i32 7, !"Dwarf Version", i32 4}
!52 = !{i32 2, !"Debug Info Version", i32 3}
!53 = !{i32 1, !"wchar_size", i32 4}
!54 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!55 = distinct !DISubprogram(name: "_hal_init", scope: !3, file: !3, line: 107, type: !56, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!56 = !DISubroutineType(types: !57)
!57 = !{null, !28, !28}
!58 = !DILocalVariable(name: "inuri", arg: 1, scope: !55, file: !3, line: 107, type: !28)
!59 = !DILocation(line: 107, column: 22, scope: !55)
!60 = !DILocalVariable(name: "outuri", arg: 2, scope: !55, file: !3, line: 107, type: !28)
!61 = !DILocation(line: 107, column: 35, scope: !55)
!62 = !DILocation(line: 109, column: 16, scope: !55)
!63 = !DILocation(line: 109, column: 5, scope: !55)
!64 = !DILocation(line: 110, column: 17, scope: !55)
!65 = !DILocation(line: 110, column: 5, scope: !55)
!66 = !DILocation(line: 111, column: 5, scope: !55)
!67 = !DILocation(line: 112, column: 5, scope: !55)
!68 = !DILocation(line: 113, column: 5, scope: !55)
!69 = !DILocation(line: 114, column: 5, scope: !55)
!70 = !DILocation(line: 116, column: 1, scope: !55)
!71 = !DILocalVariable(name: "n_tag", arg: 1, scope: !2, file: !3, line: 118, type: !6)
!72 = !DILocation(line: 118, column: 33, scope: !2)
!73 = !DILocalVariable(name: "t_tag", scope: !2, file: !3, line: 134, type: !7)
!74 = !DILocation(line: 134, column: 14, scope: !2)
!75 = !DILocalVariable(name: "o_tag", scope: !2, file: !3, line: 135, type: !7)
!76 = !DILocation(line: 135, column: 14, scope: !2)
!77 = !DILocalVariable(name: "nxt", scope: !2, file: !3, line: 139, type: !78)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "nextrpc_datatype", file: !79, line: 39, baseType: !80)
!79 = !DIFile(filename: "./partitioned/multithreaded/autogen/codec.h", directory: "/workspaces/build/apps/examples/example1")
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
!100 = !DILocation(line: 139, column: 22, scope: !2)
!101 = !DILocation(line: 139, column: 5, scope: !2)
!102 = !DILocation(line: 145, column: 5, scope: !2)
!103 = !DILocalVariable(name: "okay", scope: !2, file: !3, line: 149, type: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "okay_datatype", file: !79, line: 51, baseType: !105)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_okay_datatype", file: !79, line: 48, size: 160, elements: !106)
!106 = !{!107, !108}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !105, file: !79, line: 49, baseType: !83, size: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !105, file: !79, line: 50, baseType: !89, size: 128, offset: 32)
!109 = !DILocation(line: 149, column: 19, scope: !2)
!110 = !DILocation(line: 149, column: 5, scope: !2)
!111 = !DILocation(line: 155, column: 5, scope: !2)
!112 = !DILocation(line: 163, column: 10, scope: !113)
!113 = distinct !DILexicalBlock(scope: !2, file: !3, line: 163, column: 9)
!114 = !DILocation(line: 163, column: 9, scope: !2)
!115 = !DILocation(line: 164, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !3, line: 163, column: 18)
!117 = !DILocation(line: 165, column: 19, scope: !116)
!118 = !DILocation(line: 165, column: 17, scope: !116)
!119 = !DILocation(line: 166, column: 19, scope: !116)
!120 = !DILocation(line: 166, column: 17, scope: !116)
!121 = !DILocation(line: 167, column: 9, scope: !116)
!122 = !DILocation(line: 168, column: 5, scope: !116)
!123 = !DILocation(line: 170, column: 15, scope: !2)
!124 = !DILocation(line: 170, column: 22, scope: !2)
!125 = !DILocation(line: 170, column: 9, scope: !2)
!126 = !DILocation(line: 170, column: 13, scope: !2)
!127 = !DILocation(line: 171, column: 15, scope: !2)
!128 = !DILocation(line: 171, column: 22, scope: !2)
!129 = !DILocation(line: 171, column: 9, scope: !2)
!130 = !DILocation(line: 171, column: 13, scope: !2)
!131 = !DILocation(line: 172, column: 15, scope: !2)
!132 = !DILocation(line: 172, column: 22, scope: !2)
!133 = !DILocation(line: 172, column: 9, scope: !2)
!134 = !DILocation(line: 172, column: 13, scope: !2)
!135 = !DILocation(line: 180, column: 19, scope: !2)
!136 = !DILocation(line: 180, column: 28, scope: !2)
!137 = !DILocation(line: 180, column: 5, scope: !2)
!138 = !DILocation(line: 181, column: 23, scope: !2)
!139 = !DILocation(line: 181, column: 32, scope: !2)
!140 = !DILocation(line: 181, column: 5, scope: !2)
!141 = !DILocation(line: 184, column: 1, scope: !2)
!142 = distinct !DISubprogram(name: "_rpc_get_a_sync_request_counter", scope: !3, file: !3, line: 195, type: !143, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!143 = !DISubroutineType(types: !144)
!144 = !{!22, !42, !33, !33, !6, !6}
!145 = !DILocalVariable(name: "request_counter", arg: 1, scope: !142, file: !3, line: 195, type: !42)
!146 = !DILocation(line: 195, column: 50, scope: !142)
!147 = !DILocalVariable(name: "psocket", arg: 2, scope: !142, file: !3, line: 195, type: !33)
!148 = !DILocation(line: 195, column: 73, scope: !142)
!149 = !DILocalVariable(name: "ssocket", arg: 3, scope: !142, file: !3, line: 195, type: !33)
!150 = !DILocation(line: 195, column: 88, scope: !142)
!151 = !DILocalVariable(name: "t_tag", arg: 4, scope: !142, file: !3, line: 195, type: !6)
!152 = !DILocation(line: 195, column: 107, scope: !142)
!153 = !DILocalVariable(name: "o_tag", arg: 5, scope: !142, file: !3, line: 195, type: !6)
!154 = !DILocation(line: 195, column: 124, scope: !142)
!155 = !DILocalVariable(name: "tries_remaining", scope: !142, file: !3, line: 196, type: !43)
!156 = !DILocation(line: 196, column: 6, scope: !142)
!157 = !DILocation(line: 197, column: 2, scope: !142)
!158 = !DILocation(line: 197, column: 8, scope: !142)
!159 = !DILocation(line: 197, column: 23, scope: !142)
!160 = !DILocalVariable(name: "req_get_a", scope: !161, file: !3, line: 200, type: !162)
!161 = distinct !DILexicalBlock(scope: !142, file: !3, line: 197, column: 27)
!162 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_a_datatype", file: !79, line: 61, baseType: !163)
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_a_datatype", file: !79, line: 58, size: 160, elements: !164)
!164 = !{!165, !166}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !163, file: !79, line: 59, baseType: !83, size: 32)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !163, file: !79, line: 60, baseType: !89, size: 128, offset: 32)
!167 = !DILocation(line: 200, column: 26, scope: !161)
!168 = !DILocalVariable(name: "res_get_a", scope: !161, file: !3, line: 203, type: !169)
!169 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_a_datatype", file: !79, line: 71, baseType: !170)
!170 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_a_datatype", file: !79, line: 68, size: 192, elements: !171)
!171 = !{!172, !173}
!172 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !170, file: !79, line: 69, baseType: !41, size: 64)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !170, file: !79, line: 70, baseType: !89, size: 128, offset: 64)
!174 = !DILocation(line: 203, column: 27, scope: !161)
!175 = !DILocation(line: 207, column: 13, scope: !161)
!176 = !DILocation(line: 207, column: 19, scope: !161)
!177 = !DILocation(line: 208, column: 28, scope: !161)
!178 = !DILocation(line: 208, column: 27, scope: !161)
!179 = !DILocation(line: 208, column: 13, scope: !161)
!180 = !DILocation(line: 208, column: 21, scope: !161)
!181 = !DILocation(line: 208, column: 25, scope: !161)
!182 = !DILocation(line: 210, column: 17, scope: !161)
!183 = !DILocation(line: 210, column: 26, scope: !161)
!184 = !DILocation(line: 210, column: 38, scope: !161)
!185 = !DILocation(line: 210, column: 3, scope: !161)
!186 = !DILocalVariable(name: "status", scope: !161, file: !3, line: 211, type: !43)
!187 = !DILocation(line: 211, column: 7, scope: !161)
!188 = !DILocation(line: 211, column: 25, scope: !161)
!189 = !DILocation(line: 211, column: 34, scope: !161)
!190 = !DILocation(line: 211, column: 46, scope: !161)
!191 = !DILocation(line: 211, column: 16, scope: !161)
!192 = !DILocalVariable(name: "respId", scope: !161, file: !3, line: 212, type: !43)
!193 = !DILocation(line: 212, column: 7, scope: !161)
!194 = !DILocation(line: 212, column: 26, scope: !161)
!195 = !DILocation(line: 212, column: 34, scope: !161)
!196 = !DILocation(line: 212, column: 38, scope: !161)
!197 = !DILocalVariable(name: "error", scope: !161, file: !3, line: 213, type: !198)
!198 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!199 = !DILocation(line: 213, column: 8, scope: !161)
!200 = !DILocation(line: 213, column: 27, scope: !161)
!201 = !DILocation(line: 213, column: 35, scope: !161)
!202 = !DILocation(line: 213, column: 39, scope: !161)
!203 = !DILocation(line: 213, column: 44, scope: !161)
!204 = !DILocation(line: 213, column: 16, scope: !161)
!205 = !DILocalVariable(name: "callee_restarted", scope: !161, file: !3, line: 214, type: !198)
!206 = !DILocation(line: 214, column: 8, scope: !161)
!207 = !DILocation(line: 214, column: 37, scope: !161)
!208 = !DILocation(line: 214, column: 45, scope: !161)
!209 = !DILocation(line: 214, column: 49, scope: !161)
!210 = !DILocation(line: 214, column: 27, scope: !161)
!211 = !DILocation(line: 215, column: 6, scope: !212)
!212 = distinct !DILexicalBlock(scope: !161, file: !3, line: 215, column: 6)
!213 = !DILocation(line: 215, column: 13, scope: !212)
!214 = !DILocation(line: 215, column: 6, scope: !161)
!215 = !DILocation(line: 216, column: 19, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !3, line: 215, column: 24)
!217 = !DILocation(line: 217, column: 3, scope: !216)
!218 = !DILocation(line: 219, column: 23, scope: !219)
!219 = distinct !DILexicalBlock(scope: !212, file: !3, line: 218, column: 7)
!220 = !DILocation(line: 219, column: 5, scope: !219)
!221 = !DILocation(line: 219, column: 21, scope: !219)
!222 = !DILocation(line: 220, column: 4, scope: !219)
!223 = distinct !{!223, !157, !224}
!224 = !DILocation(line: 222, column: 2, scope: !142)
!225 = !DILocation(line: 223, column: 2, scope: !142)
!226 = !DILocation(line: 224, column: 1, scope: !142)
!227 = distinct !DISubprogram(name: "_rpc_get_a_remote_call", scope: !3, file: !3, line: 226, type: !228, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!228 = !DISubroutineType(types: !229)
!229 = !{!22, !43, !230, !33, !33, !6, !6}
!230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!231 = !DILocalVariable(name: "reqId", arg: 1, scope: !227, file: !3, line: 226, type: !43)
!232 = !DILocation(line: 226, column: 40, scope: !227)
!233 = !DILocalVariable(name: "result", arg: 2, scope: !227, file: !3, line: 226, type: !230)
!234 = !DILocation(line: 226, column: 55, scope: !227)
!235 = !DILocalVariable(name: "psocket", arg: 3, scope: !227, file: !3, line: 226, type: !33)
!236 = !DILocation(line: 226, column: 69, scope: !227)
!237 = !DILocalVariable(name: "ssocket", arg: 4, scope: !227, file: !3, line: 226, type: !33)
!238 = !DILocation(line: 226, column: 84, scope: !227)
!239 = !DILocalVariable(name: "t_tag", arg: 5, scope: !227, file: !3, line: 226, type: !6)
!240 = !DILocation(line: 226, column: 103, scope: !227)
!241 = !DILocalVariable(name: "o_tag", arg: 6, scope: !227, file: !3, line: 226, type: !6)
!242 = !DILocation(line: 226, column: 120, scope: !227)
!243 = !DILocalVariable(name: "tries_remaining", scope: !227, file: !3, line: 228, type: !43)
!244 = !DILocation(line: 228, column: 6, scope: !227)
!245 = !DILocation(line: 229, column: 2, scope: !227)
!246 = !DILocation(line: 229, column: 8, scope: !227)
!247 = !DILocation(line: 229, column: 23, scope: !227)
!248 = !DILocalVariable(name: "req_get_a", scope: !249, file: !3, line: 232, type: !162)
!249 = distinct !DILexicalBlock(scope: !227, file: !3, line: 229, column: 27)
!250 = !DILocation(line: 232, column: 26, scope: !249)
!251 = !DILocalVariable(name: "res_get_a", scope: !249, file: !3, line: 235, type: !169)
!252 = !DILocation(line: 235, column: 27, scope: !249)
!253 = !DILocation(line: 239, column: 13, scope: !249)
!254 = !DILocation(line: 239, column: 19, scope: !249)
!255 = !DILocation(line: 240, column: 27, scope: !249)
!256 = !DILocation(line: 240, column: 13, scope: !249)
!257 = !DILocation(line: 240, column: 21, scope: !249)
!258 = !DILocation(line: 240, column: 25, scope: !249)
!259 = !DILocation(line: 242, column: 17, scope: !249)
!260 = !DILocation(line: 242, column: 26, scope: !249)
!261 = !DILocation(line: 242, column: 38, scope: !249)
!262 = !DILocation(line: 242, column: 3, scope: !249)
!263 = !DILocalVariable(name: "status", scope: !249, file: !3, line: 243, type: !43)
!264 = !DILocation(line: 243, column: 7, scope: !249)
!265 = !DILocation(line: 243, column: 25, scope: !249)
!266 = !DILocation(line: 243, column: 34, scope: !249)
!267 = !DILocation(line: 243, column: 46, scope: !249)
!268 = !DILocation(line: 243, column: 16, scope: !249)
!269 = !DILocalVariable(name: "respId", scope: !249, file: !3, line: 244, type: !43)
!270 = !DILocation(line: 244, column: 7, scope: !249)
!271 = !DILocation(line: 244, column: 26, scope: !249)
!272 = !DILocation(line: 244, column: 34, scope: !249)
!273 = !DILocation(line: 244, column: 38, scope: !249)
!274 = !DILocalVariable(name: "error", scope: !249, file: !3, line: 245, type: !198)
!275 = !DILocation(line: 245, column: 8, scope: !249)
!276 = !DILocation(line: 245, column: 27, scope: !249)
!277 = !DILocation(line: 245, column: 35, scope: !249)
!278 = !DILocation(line: 245, column: 39, scope: !249)
!279 = !DILocation(line: 245, column: 44, scope: !249)
!280 = !DILocation(line: 245, column: 16, scope: !249)
!281 = !DILocalVariable(name: "callee_restarted", scope: !249, file: !3, line: 246, type: !198)
!282 = !DILocation(line: 246, column: 8, scope: !249)
!283 = !DILocation(line: 246, column: 37, scope: !249)
!284 = !DILocation(line: 246, column: 45, scope: !249)
!285 = !DILocation(line: 246, column: 49, scope: !249)
!286 = !DILocation(line: 246, column: 27, scope: !249)
!287 = !DILocation(line: 247, column: 6, scope: !288)
!288 = distinct !DILexicalBlock(scope: !249, file: !3, line: 247, column: 6)
!289 = !DILocation(line: 247, column: 13, scope: !288)
!290 = !DILocation(line: 247, column: 6, scope: !249)
!291 = !DILocation(line: 248, column: 19, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !3, line: 247, column: 24)
!293 = !DILocation(line: 249, column: 3, scope: !292)
!294 = !DILocation(line: 251, column: 7, scope: !295)
!295 = distinct !DILexicalBlock(scope: !296, file: !3, line: 251, column: 7)
!296 = distinct !DILexicalBlock(scope: !288, file: !3, line: 250, column: 7)
!297 = !DILocation(line: 251, column: 16, scope: !295)
!298 = !DILocation(line: 251, column: 14, scope: !295)
!299 = !DILocation(line: 251, column: 7, scope: !296)
!300 = !DILocation(line: 252, column: 5, scope: !301)
!301 = distinct !DILexicalBlock(scope: !295, file: !3, line: 251, column: 22)
!302 = distinct !{!302, !245, !303}
!303 = !DILocation(line: 264, column: 2, scope: !227)
!304 = !DILocation(line: 254, column: 7, scope: !305)
!305 = distinct !DILexicalBlock(scope: !296, file: !3, line: 254, column: 7)
!306 = !DILocation(line: 254, column: 7, scope: !296)
!307 = !DILocation(line: 255, column: 5, scope: !308)
!308 = distinct !DILexicalBlock(scope: !305, file: !3, line: 254, column: 13)
!309 = !DILocation(line: 257, column: 7, scope: !310)
!310 = distinct !DILexicalBlock(scope: !296, file: !3, line: 257, column: 7)
!311 = !DILocation(line: 257, column: 7, scope: !296)
!312 = !DILocation(line: 258, column: 25, scope: !313)
!313 = distinct !DILexicalBlock(scope: !310, file: !3, line: 257, column: 24)
!314 = !DILocation(line: 258, column: 6, scope: !313)
!315 = !DILocation(line: 258, column: 13, scope: !313)
!316 = !DILocation(line: 259, column: 5, scope: !313)
!317 = !DILocation(line: 261, column: 24, scope: !296)
!318 = !DILocation(line: 261, column: 5, scope: !296)
!319 = !DILocation(line: 261, column: 12, scope: !296)
!320 = !DILocation(line: 262, column: 4, scope: !296)
!321 = !DILocation(line: 265, column: 2, scope: !227)
!322 = !DILocation(line: 266, column: 1, scope: !227)
!323 = !DILocalVariable(name: "error", arg: 1, scope: !38, file: !3, line: 270, type: !42)
!324 = !DILocation(line: 270, column: 24, scope: !38)
!325 = !DILocalVariable(name: "restarted", arg: 2, scope: !38, file: !3, line: 270, type: !42)
!326 = !DILocation(line: 270, column: 36, scope: !38)
!327 = !DILocalVariable(name: "t_tag", scope: !38, file: !3, line: 289, type: !7)
!328 = !DILocation(line: 289, column: 14, scope: !38)
!329 = !DILocalVariable(name: "o_tag", scope: !38, file: !3, line: 290, type: !7)
!330 = !DILocation(line: 290, column: 14, scope: !38)
!331 = !DILocalVariable(name: "req_get_a", scope: !38, file: !3, line: 294, type: !162)
!332 = !DILocation(line: 294, column: 28, scope: !38)
!333 = !DILocation(line: 294, column: 5, scope: !38)
!334 = !DILocation(line: 300, column: 5, scope: !38)
!335 = !DILocalVariable(name: "res_get_a", scope: !38, file: !3, line: 304, type: !169)
!336 = !DILocation(line: 304, column: 29, scope: !38)
!337 = !DILocation(line: 304, column: 5, scope: !38)
!338 = !DILocation(line: 310, column: 5, scope: !38)
!339 = !DILocation(line: 312, column: 15, scope: !38)
!340 = !DILocation(line: 312, column: 21, scope: !38)
!341 = !DILocation(line: 319, column: 10, scope: !342)
!342 = distinct !DILexicalBlock(scope: !38, file: !3, line: 319, column: 9)
!343 = !DILocation(line: 319, column: 9, scope: !38)
!344 = !DILocation(line: 320, column: 16, scope: !345)
!345 = distinct !DILexicalBlock(scope: !342, file: !3, line: 319, column: 18)
!346 = !DILocation(line: 321, column: 19, scope: !345)
!347 = !DILocation(line: 321, column: 17, scope: !345)
!348 = !DILocation(line: 322, column: 19, scope: !345)
!349 = !DILocation(line: 322, column: 17, scope: !345)
!350 = !DILocation(line: 323, column: 9, scope: !345)
!351 = !DILocalVariable(name: "status", scope: !345, file: !3, line: 324, type: !43)
!352 = !DILocation(line: 324, column: 13, scope: !345)
!353 = !DILocation(line: 324, column: 72, scope: !345)
!354 = !DILocation(line: 324, column: 81, scope: !345)
!355 = !DILocation(line: 324, column: 22, scope: !345)
!356 = !DILocation(line: 325, column: 6, scope: !357)
!357 = distinct !DILexicalBlock(scope: !345, file: !3, line: 325, column: 6)
!358 = !DILocation(line: 325, column: 13, scope: !357)
!359 = !DILocation(line: 325, column: 6, scope: !345)
!360 = !DILocation(line: 326, column: 5, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !3, line: 325, column: 23)
!362 = !DILocation(line: 326, column: 11, scope: !361)
!363 = !DILocation(line: 327, column: 4, scope: !361)
!364 = !DILocation(line: 330, column: 5, scope: !345)
!365 = !DILocation(line: 331, column: 20, scope: !38)
!366 = !DILocation(line: 343, column: 19, scope: !38)
!367 = !DILocation(line: 343, column: 28, scope: !38)
!368 = !DILocation(line: 343, column: 5, scope: !38)
!369 = !DILocalVariable(name: "result", scope: !38, file: !3, line: 346, type: !41)
!370 = !DILocation(line: 346, column: 12, scope: !38)
!371 = !DILocalVariable(name: "status", scope: !38, file: !3, line: 347, type: !22)
!372 = !DILocation(line: 347, column: 14, scope: !38)
!373 = !DILocation(line: 347, column: 46, scope: !38)
!374 = !DILocation(line: 347, column: 73, scope: !38)
!375 = !DILocation(line: 347, column: 82, scope: !38)
!376 = !DILocation(line: 347, column: 23, scope: !38)
!377 = !DILocation(line: 349, column: 5, scope: !378)
!378 = distinct !DILexicalBlock(scope: !38, file: !3, line: 349, column: 5)
!379 = !DILocation(line: 349, column: 12, scope: !378)
!380 = !DILocation(line: 349, column: 5, scope: !38)
!381 = !DILocation(line: 351, column: 4, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !3, line: 349, column: 22)
!383 = !DILocation(line: 351, column: 10, scope: !382)
!384 = !DILocation(line: 352, column: 3, scope: !382)
!385 = !DILocation(line: 354, column: 5, scope: !386)
!386 = distinct !DILexicalBlock(scope: !38, file: !3, line: 354, column: 5)
!387 = !DILocation(line: 354, column: 12, scope: !386)
!388 = !DILocation(line: 354, column: 5, scope: !38)
!389 = !DILocation(line: 355, column: 4, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !3, line: 354, column: 25)
!391 = !DILocation(line: 355, column: 14, scope: !390)
!392 = !DILocation(line: 356, column: 3, scope: !390)
!393 = !DILocation(line: 357, column: 2, scope: !390)
!394 = !DILocation(line: 358, column: 10, scope: !38)
!395 = !DILocation(line: 358, column: 2, scope: !38)
!396 = !DILocation(line: 368, column: 1, scope: !38)
!397 = distinct !DISubprogram(name: "_master_rpc_init", scope: !3, file: !3, line: 370, type: !398, scopeLine: 370, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!398 = !DISubroutineType(types: !399)
!399 = !{null}
!400 = !DILocation(line: 371, column: 5, scope: !397)
!401 = !DILocation(line: 372, column: 1, scope: !397)
