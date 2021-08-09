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
@.str.3 = private unnamed_addr constant [18 x i8] c"TAG_REQUEST_GET_A\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [19 x i8] c"TAG_RESPONSE_GET_A\00", section "llvm.metadata"
@_rpc_get_a.inited = internal global i32 0, align 4, !dbg !36
@_rpc_get_a.psocket = internal global i8* null, align 8, !dbg !45
@_rpc_get_a.ssocket = internal global i8* null, align 8, !dbg !47
@_rpc_get_a.request_counter = internal global i32 -2147483648, align 4, !dbg !49
@.str.5 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_subpurple\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_pubpurple\00", align 1

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
  call void @llvm.var.annotation(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 138), !dbg !101
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 1), !dbg !102
  call void @llvm.dbg.declare(metadata %struct._okay_datatype* %6, metadata !103, metadata !DIExpression()), !dbg !109
  %9 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !110
  call void @llvm.var.annotation(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 148), !dbg !110
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
  store i32 15, i32* %12, align 4, !dbg !156
  br label %19, !dbg !157

19:                                               ; preds = %62, %5
  %20 = load i32, i32* %12, align 4, !dbg !158
  %21 = icmp ne i32 %20, 0, !dbg !159
  br i1 %21, label %22, label %63, !dbg !157

22:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %13, metadata !160, metadata !DIExpression()), !dbg !167
  %23 = bitcast %struct._request_get_a_datatype* %13 to i8*, !dbg !168
  call void @llvm.var.annotation(i8* %23, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 196), !dbg !168
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %14, metadata !169, metadata !DIExpression()), !dbg !175
  %24 = bitcast %struct._response_get_a_datatype* %14 to i8*, !dbg !176
  call void @llvm.var.annotation(i8* %24, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 202), !dbg !176
  %25 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %13, i32 0, i32 0, !dbg !177
  store i32 0, i32* %25, align 1, !dbg !178
  %26 = load i32*, i32** %7, align 8, !dbg !179
  %27 = load i32, i32* %26, align 4, !dbg !180
  %28 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %13, i32 0, i32 1, !dbg !181
  %29 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %28, i32 0, i32 0, !dbg !182
  store i32 %27, i32* %29, align 1, !dbg !183
  %30 = load i8*, i8** %8, align 8, !dbg !184
  %31 = bitcast %struct._request_get_a_datatype* %13 to i8*, !dbg !185
  %32 = load %struct._tag*, %struct._tag** %10, align 8, !dbg !186
  call void @xdc_asyn_send(i8* %30, i8* %31, %struct._tag* %32), !dbg !187
  call void @llvm.dbg.declare(metadata i32* %15, metadata !188, metadata !DIExpression()), !dbg !189
  %33 = load i8*, i8** %9, align 8, !dbg !190
  %34 = bitcast %struct._response_get_a_datatype* %14 to i8*, !dbg !191
  %35 = load %struct._tag*, %struct._tag** %11, align 8, !dbg !192
  %36 = call i32 @xdc_recv(i8* %33, i8* %34, %struct._tag* %35), !dbg !193
  store i32 %36, i32* %15, align 4, !dbg !189
  call void @llvm.dbg.declare(metadata i32* %16, metadata !194, metadata !DIExpression()), !dbg !195
  %37 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %14, i32 0, i32 1, !dbg !196
  %38 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %37, i32 0, i32 0, !dbg !197
  %39 = load i32, i32* %38, align 1, !dbg !197
  %40 = lshr i32 %39, 2, !dbg !198
  store i32 %40, i32* %16, align 4, !dbg !195
  call void @llvm.dbg.declare(metadata i8* %17, metadata !199, metadata !DIExpression()), !dbg !201
  %41 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %14, i32 0, i32 1, !dbg !202
  %42 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %41, i32 0, i32 0, !dbg !203
  %43 = load i32, i32* %42, align 1, !dbg !203
  %44 = lshr i32 %43, 1, !dbg !204
  %45 = and i32 %44, 1, !dbg !205
  %46 = icmp ne i32 %45, 0, !dbg !206
  %47 = zext i1 %46 to i8, !dbg !201
  store i8 %47, i8* %17, align 1, !dbg !201
  call void @llvm.dbg.declare(metadata i8* %18, metadata !207, metadata !DIExpression()), !dbg !208
  %48 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %14, i32 0, i32 1, !dbg !209
  %49 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %48, i32 0, i32 0, !dbg !210
  %50 = load i32, i32* %49, align 1, !dbg !210
  %51 = and i32 %50, 1, !dbg !211
  %52 = icmp ne i32 %51, 0, !dbg !212
  %53 = zext i1 %52 to i8, !dbg !208
  store i8 %53, i8* %18, align 1, !dbg !208
  %54 = load i32, i32* %15, align 4, !dbg !213
  %55 = icmp eq i32 %54, -1, !dbg !215
  br i1 %55, label %56, label %59, !dbg !216

56:                                               ; preds = %22
  %57 = load i32, i32* %12, align 4, !dbg !217
  %58 = add nsw i32 %57, -1, !dbg !217
  store i32 %58, i32* %12, align 4, !dbg !217
  br label %62, !dbg !219

59:                                               ; preds = %22
  %60 = load i32, i32* %16, align 4, !dbg !220
  %61 = load i32*, i32** %7, align 8, !dbg !222
  store i32 %60, i32* %61, align 4, !dbg !223
  store i32 1, i32* %6, align 4, !dbg !224
  br label %64, !dbg !224

62:                                               ; preds = %56
  br label %19, !dbg !157, !llvm.loop !225

63:                                               ; preds = %19
  store i32 0, i32* %6, align 4, !dbg !227
  br label %64, !dbg !227

64:                                               ; preds = %63, %59
  %65 = load i32, i32* %6, align 4, !dbg !228
  ret i32 %65, !dbg !228
}

declare dso_local i32 @xdc_recv(i8*, i8*, %struct._tag*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_rpc_get_a_remote_call(i32 %0, double* %1, i8* %2, i8* %3, %struct._tag* %4, %struct._tag* %5) #0 !dbg !229 {
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
  call void @llvm.dbg.declare(metadata i32* %8, metadata !233, metadata !DIExpression()), !dbg !234
  store double* %1, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !235, metadata !DIExpression()), !dbg !236
  store i8* %2, i8** %10, align 8
  call void @llvm.dbg.declare(metadata i8** %10, metadata !237, metadata !DIExpression()), !dbg !238
  store i8* %3, i8** %11, align 8
  call void @llvm.dbg.declare(metadata i8** %11, metadata !239, metadata !DIExpression()), !dbg !240
  store %struct._tag* %4, %struct._tag** %12, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %12, metadata !241, metadata !DIExpression()), !dbg !242
  store %struct._tag* %5, %struct._tag** %13, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %13, metadata !243, metadata !DIExpression()), !dbg !244
  call void @llvm.dbg.declare(metadata i32* %14, metadata !245, metadata !DIExpression()), !dbg !246
  store i32 15, i32* %14, align 4, !dbg !246
  br label %21, !dbg !247

21:                                               ; preds = %80, %64, %6
  %22 = load i32, i32* %14, align 4, !dbg !248
  %23 = icmp ne i32 %22, 0, !dbg !249
  br i1 %23, label %24, label %81, !dbg !247

24:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %15, metadata !250, metadata !DIExpression()), !dbg !252
  %25 = bitcast %struct._request_get_a_datatype* %15 to i8*, !dbg !253
  call void @llvm.var.annotation(i8* %25, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 229), !dbg !253
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %16, metadata !254, metadata !DIExpression()), !dbg !255
  %26 = bitcast %struct._response_get_a_datatype* %16 to i8*, !dbg !256
  call void @llvm.var.annotation(i8* %26, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 235), !dbg !256
  %27 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %15, i32 0, i32 0, !dbg !257
  store i32 0, i32* %27, align 1, !dbg !258
  %28 = load i32, i32* %8, align 4, !dbg !259
  %29 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %15, i32 0, i32 1, !dbg !260
  %30 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %29, i32 0, i32 0, !dbg !261
  store i32 %28, i32* %30, align 1, !dbg !262
  %31 = load i8*, i8** %10, align 8, !dbg !263
  %32 = bitcast %struct._request_get_a_datatype* %15 to i8*, !dbg !264
  %33 = load %struct._tag*, %struct._tag** %12, align 8, !dbg !265
  call void @xdc_asyn_send(i8* %31, i8* %32, %struct._tag* %33), !dbg !266
  call void @llvm.dbg.declare(metadata i32* %17, metadata !267, metadata !DIExpression()), !dbg !268
  %34 = load i8*, i8** %11, align 8, !dbg !269
  %35 = bitcast %struct._response_get_a_datatype* %16 to i8*, !dbg !270
  %36 = load %struct._tag*, %struct._tag** %13, align 8, !dbg !271
  %37 = call i32 @xdc_recv(i8* %34, i8* %35, %struct._tag* %36), !dbg !272
  store i32 %37, i32* %17, align 4, !dbg !268
  call void @llvm.dbg.declare(metadata i32* %18, metadata !273, metadata !DIExpression()), !dbg !274
  %38 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %16, i32 0, i32 1, !dbg !275
  %39 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %38, i32 0, i32 0, !dbg !276
  %40 = load i32, i32* %39, align 1, !dbg !276
  %41 = lshr i32 %40, 2, !dbg !277
  store i32 %41, i32* %18, align 4, !dbg !274
  call void @llvm.dbg.declare(metadata i8* %19, metadata !278, metadata !DIExpression()), !dbg !279
  %42 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %16, i32 0, i32 1, !dbg !280
  %43 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %42, i32 0, i32 0, !dbg !281
  %44 = load i32, i32* %43, align 1, !dbg !281
  %45 = lshr i32 %44, 1, !dbg !282
  %46 = and i32 %45, 1, !dbg !283
  %47 = icmp ne i32 %46, 0, !dbg !284
  %48 = zext i1 %47 to i8, !dbg !279
  store i8 %48, i8* %19, align 1, !dbg !279
  call void @llvm.dbg.declare(metadata i8* %20, metadata !285, metadata !DIExpression()), !dbg !286
  %49 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %16, i32 0, i32 1, !dbg !287
  %50 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %49, i32 0, i32 0, !dbg !288
  %51 = load i32, i32* %50, align 1, !dbg !288
  %52 = and i32 %51, 1, !dbg !289
  %53 = icmp ne i32 %52, 0, !dbg !290
  %54 = zext i1 %53 to i8, !dbg !286
  store i8 %54, i8* %20, align 1, !dbg !286
  %55 = load i32, i32* %17, align 4, !dbg !291
  %56 = icmp eq i32 %55, -1, !dbg !293
  br i1 %56, label %57, label %60, !dbg !294

57:                                               ; preds = %24
  %58 = load i32, i32* %14, align 4, !dbg !295
  %59 = add nsw i32 %58, -1, !dbg !295
  store i32 %59, i32* %14, align 4, !dbg !295
  br label %80, !dbg !297

60:                                               ; preds = %24
  %61 = load i32, i32* %18, align 4, !dbg !298
  %62 = load i32, i32* %8, align 4, !dbg !301
  %63 = icmp slt i32 %61, %62, !dbg !302
  br i1 %63, label %64, label %65, !dbg !303

64:                                               ; preds = %60
  br label %21, !dbg !304, !llvm.loop !306

65:                                               ; preds = %60
  %66 = load i8, i8* %19, align 1, !dbg !308
  %67 = trunc i8 %66 to i1, !dbg !308
  br i1 %67, label %68, label %69, !dbg !310

68:                                               ; preds = %65
  store i32 0, i32* %7, align 4, !dbg !311
  br label %82, !dbg !311

69:                                               ; preds = %65
  %70 = load i8, i8* %20, align 1, !dbg !313
  %71 = trunc i8 %70 to i1, !dbg !313
  br i1 %71, label %72, label %76, !dbg !315

72:                                               ; preds = %69
  %73 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %16, i32 0, i32 0, !dbg !316
  %74 = load double, double* %73, align 1, !dbg !316
  %75 = load double*, double** %9, align 8, !dbg !318
  store double %74, double* %75, align 8, !dbg !319
  store i32 2, i32* %7, align 4, !dbg !320
  br label %82, !dbg !320

76:                                               ; preds = %69
  %77 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %16, i32 0, i32 0, !dbg !321
  %78 = load double, double* %77, align 1, !dbg !321
  %79 = load double*, double** %9, align 8, !dbg !322
  store double %78, double* %79, align 8, !dbg !323
  store i32 1, i32* %7, align 4, !dbg !324
  br label %82, !dbg !324

80:                                               ; preds = %57
  br label %21, !dbg !247, !llvm.loop !306

81:                                               ; preds = %21
  store i32 0, i32* %7, align 4, !dbg !325
  br label %82, !dbg !325

82:                                               ; preds = %81, %76, %72, %68
  %83 = load i32, i32* %7, align 4, !dbg !326
  ret i32 %83, !dbg !326
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
  call void @llvm.dbg.declare(metadata i32** %4, metadata !327, metadata !DIExpression()), !dbg !328
  store i32* %1, i32** %5, align 8
  call void @llvm.dbg.declare(metadata i32** %5, metadata !329, metadata !DIExpression()), !dbg !330
  call void @llvm.dbg.declare(metadata %struct._tag* %6, metadata !331, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.declare(metadata %struct._tag* %7, metadata !333, metadata !DIExpression()), !dbg !334
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %8, metadata !335, metadata !DIExpression()), !dbg !336
  %14 = bitcast %struct._request_get_a_datatype* %8 to i8*, !dbg !337
  call void @llvm.var.annotation(i8* %14, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 288), !dbg !337
  call void @tag_write(%struct._tag* %6, i32 2, i32 2, i32 3), !dbg !338
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %9, metadata !339, metadata !DIExpression()), !dbg !340
  %15 = bitcast %struct._response_get_a_datatype* %9 to i8*, !dbg !341
  call void @llvm.var.annotation(i8* %15, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 298), !dbg !341
  call void @tag_write(%struct._tag* %7, i32 1, i32 1, i32 4), !dbg !342
  %16 = load i32, i32* @_rpc_get_a.inited, align 4, !dbg !343
  %17 = icmp ne i32 %16, 0, !dbg !343
  br i1 %17, label %36, label %18, !dbg !345

18:                                               ; preds = %2
  store i32 1, i32* @_rpc_get_a.inited, align 4, !dbg !346
  %19 = call i8* @xdc_pub_socket(), !dbg !348
  store i8* %19, i8** @_rpc_get_a.psocket, align 8, !dbg !349
  %20 = bitcast { i64, i32 }* %10 to i8*, !dbg !350
  %21 = bitcast %struct._tag* %7 to i8*, !dbg !350
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %20, i8* align 1 %21, i64 12, i1 false), !dbg !350
  %22 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %10, i32 0, i32 0, !dbg !350
  %23 = load i64, i64* %22, align 1, !dbg !350
  %24 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %10, i32 0, i32 1, !dbg !350
  %25 = load i32, i32* %24, align 1, !dbg !350
  %26 = call i8* @xdc_sub_socket_non_blocking(i64 %23, i32 %25, i32 1000), !dbg !350
  store i8* %26, i8** @_rpc_get_a.ssocket, align 8, !dbg !351
  %27 = call i32 @sleep(i32 1), !dbg !352
  call void @llvm.dbg.declare(metadata i32* %11, metadata !353, metadata !DIExpression()), !dbg !354
  %28 = load i8*, i8** @_rpc_get_a.psocket, align 8, !dbg !355
  %29 = load i8*, i8** @_rpc_get_a.ssocket, align 8, !dbg !356
  %30 = call i32 @_rpc_get_a_sync_request_counter(i32* @_rpc_get_a.request_counter, i8* %28, i8* %29, %struct._tag* %6, %struct._tag* %7), !dbg !357
  store i32 %30, i32* %11, align 4, !dbg !354
  %31 = load i32, i32* %11, align 4, !dbg !358
  %32 = icmp eq i32 %31, 0, !dbg !360
  br i1 %32, label %33, label %35, !dbg !361

33:                                               ; preds = %18
  %34 = load i32*, i32** %4, align 8, !dbg !362
  store i32 1, i32* %34, align 4, !dbg !364
  store double 0.000000e+00, double* %3, align 8, !dbg !365
  br label %56, !dbg !365

35:                                               ; preds = %18
  br label %36, !dbg !366

36:                                               ; preds = %35, %2
  %37 = load i32, i32* @_rpc_get_a.request_counter, align 4, !dbg !367
  %38 = add nsw i32 %37, 1, !dbg !367
  store i32 %38, i32* @_rpc_get_a.request_counter, align 4, !dbg !367
  %39 = load i8*, i8** @_rpc_get_a.psocket, align 8, !dbg !368
  %40 = bitcast %struct._request_get_a_datatype* %8 to i8*, !dbg !369
  call void @xdc_asyn_send(i8* %39, i8* %40, %struct._tag* %6), !dbg !370
  call void @llvm.dbg.declare(metadata double* %12, metadata !371, metadata !DIExpression()), !dbg !372
  call void @llvm.dbg.declare(metadata i32* %13, metadata !373, metadata !DIExpression()), !dbg !374
  %41 = load i32, i32* @_rpc_get_a.request_counter, align 4, !dbg !375
  %42 = load i8*, i8** @_rpc_get_a.psocket, align 8, !dbg !376
  %43 = load i8*, i8** @_rpc_get_a.ssocket, align 8, !dbg !377
  %44 = call i32 @_rpc_get_a_remote_call(i32 %41, double* %12, i8* %42, i8* %43, %struct._tag* %6, %struct._tag* %7), !dbg !378
  store i32 %44, i32* %13, align 4, !dbg !374
  %45 = load i32, i32* %13, align 4, !dbg !379
  %46 = icmp eq i32 %45, 0, !dbg !381
  br i1 %46, label %47, label %49, !dbg !382

47:                                               ; preds = %36
  %48 = load i32*, i32** %4, align 8, !dbg !383
  store i32 1, i32* %48, align 4, !dbg !385
  store double 0.000000e+00, double* %3, align 8, !dbg !386
  br label %56, !dbg !386

49:                                               ; preds = %36
  %50 = load i32, i32* %13, align 4, !dbg !387
  %51 = icmp eq i32 %50, 2, !dbg !389
  br i1 %51, label %52, label %54, !dbg !390

52:                                               ; preds = %49
  %53 = load i32*, i32** %5, align 8, !dbg !391
  store i32 1, i32* %53, align 4, !dbg !393
  br label %54, !dbg !394

54:                                               ; preds = %52, %49
  %55 = load double, double* %12, align 8, !dbg !395
  store double %55, double* %3, align 8, !dbg !396
  br label %56, !dbg !396

56:                                               ; preds = %54, %47, %33
  %57 = load double, double* %3, align 8, !dbg !397
  ret double %57, !dbg !397
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_master_rpc_init() #0 !dbg !398 {
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0)), !dbg !401
  ret void, !dbg !402
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
!37 = distinct !DIGlobalVariable(name: "inited", scope: !38, file: !3, line: 279, type: !43, isLocal: true, isDefinition: true)
!38 = distinct !DISubprogram(name: "_rpc_get_a", scope: !3, file: !3, line: 266, type: !39, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!39 = !DISubroutineType(types: !40)
!40 = !{!41, !42, !42}
!41 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !{}
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(name: "psocket", scope: !38, file: !3, line: 280, type: !33, isLocal: true, isDefinition: true)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "ssocket", scope: !38, file: !3, line: 281, type: !33, isLocal: true, isDefinition: true)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(name: "request_counter", scope: !38, file: !3, line: 282, type: !43, isLocal: true, isDefinition: true)
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
!142 = distinct !DISubprogram(name: "_rpc_get_a_sync_request_counter", scope: !3, file: !3, line: 191, type: !143, scopeLine: 191, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!143 = !DISubroutineType(types: !144)
!144 = !{!22, !42, !33, !33, !6, !6}
!145 = !DILocalVariable(name: "request_counter", arg: 1, scope: !142, file: !3, line: 191, type: !42)
!146 = !DILocation(line: 191, column: 50, scope: !142)
!147 = !DILocalVariable(name: "psocket", arg: 2, scope: !142, file: !3, line: 191, type: !33)
!148 = !DILocation(line: 191, column: 73, scope: !142)
!149 = !DILocalVariable(name: "ssocket", arg: 3, scope: !142, file: !3, line: 191, type: !33)
!150 = !DILocation(line: 191, column: 88, scope: !142)
!151 = !DILocalVariable(name: "t_tag", arg: 4, scope: !142, file: !3, line: 191, type: !6)
!152 = !DILocation(line: 191, column: 107, scope: !142)
!153 = !DILocalVariable(name: "o_tag", arg: 5, scope: !142, file: !3, line: 191, type: !6)
!154 = !DILocation(line: 191, column: 124, scope: !142)
!155 = !DILocalVariable(name: "tries_remaining", scope: !142, file: !3, line: 192, type: !43)
!156 = !DILocation(line: 192, column: 9, scope: !142)
!157 = !DILocation(line: 193, column: 5, scope: !142)
!158 = !DILocation(line: 193, column: 11, scope: !142)
!159 = !DILocation(line: 193, column: 27, scope: !142)
!160 = !DILocalVariable(name: "req_get_a", scope: !161, file: !3, line: 196, type: !162)
!161 = distinct !DILexicalBlock(scope: !142, file: !3, line: 193, column: 32)
!162 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_a_datatype", file: !79, line: 61, baseType: !163)
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_a_datatype", file: !79, line: 58, size: 160, elements: !164)
!164 = !{!165, !166}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !163, file: !79, line: 59, baseType: !83, size: 32)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !163, file: !79, line: 60, baseType: !89, size: 128, offset: 32)
!167 = !DILocation(line: 196, column: 32, scope: !161)
!168 = !DILocation(line: 196, column: 9, scope: !161)
!169 = !DILocalVariable(name: "res_get_a", scope: !161, file: !3, line: 202, type: !170)
!170 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_a_datatype", file: !79, line: 71, baseType: !171)
!171 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_a_datatype", file: !79, line: 68, size: 192, elements: !172)
!172 = !{!173, !174}
!173 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !171, file: !79, line: 69, baseType: !41, size: 64)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !171, file: !79, line: 70, baseType: !89, size: 128, offset: 64)
!175 = !DILocation(line: 202, column: 33, scope: !161)
!176 = !DILocation(line: 202, column: 9, scope: !161)
!177 = !DILocation(line: 206, column: 19, scope: !161)
!178 = !DILocation(line: 206, column: 25, scope: !161)
!179 = !DILocation(line: 207, column: 34, scope: !161)
!180 = !DILocation(line: 207, column: 33, scope: !161)
!181 = !DILocation(line: 207, column: 19, scope: !161)
!182 = !DILocation(line: 207, column: 27, scope: !161)
!183 = !DILocation(line: 207, column: 31, scope: !161)
!184 = !DILocation(line: 208, column: 23, scope: !161)
!185 = !DILocation(line: 208, column: 32, scope: !161)
!186 = !DILocation(line: 208, column: 44, scope: !161)
!187 = !DILocation(line: 208, column: 9, scope: !161)
!188 = !DILocalVariable(name: "status", scope: !161, file: !3, line: 209, type: !43)
!189 = !DILocation(line: 209, column: 13, scope: !161)
!190 = !DILocation(line: 209, column: 31, scope: !161)
!191 = !DILocation(line: 209, column: 40, scope: !161)
!192 = !DILocation(line: 209, column: 52, scope: !161)
!193 = !DILocation(line: 209, column: 22, scope: !161)
!194 = !DILocalVariable(name: "respId", scope: !161, file: !3, line: 210, type: !43)
!195 = !DILocation(line: 210, column: 13, scope: !161)
!196 = !DILocation(line: 210, column: 32, scope: !161)
!197 = !DILocation(line: 210, column: 40, scope: !161)
!198 = !DILocation(line: 210, column: 44, scope: !161)
!199 = !DILocalVariable(name: "error", scope: !161, file: !3, line: 211, type: !200)
!200 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!201 = !DILocation(line: 211, column: 14, scope: !161)
!202 = !DILocation(line: 211, column: 33, scope: !161)
!203 = !DILocation(line: 211, column: 41, scope: !161)
!204 = !DILocation(line: 211, column: 45, scope: !161)
!205 = !DILocation(line: 211, column: 50, scope: !161)
!206 = !DILocation(line: 211, column: 22, scope: !161)
!207 = !DILocalVariable(name: "callee_restarted", scope: !161, file: !3, line: 212, type: !200)
!208 = !DILocation(line: 212, column: 14, scope: !161)
!209 = !DILocation(line: 212, column: 43, scope: !161)
!210 = !DILocation(line: 212, column: 51, scope: !161)
!211 = !DILocation(line: 212, column: 55, scope: !161)
!212 = !DILocation(line: 212, column: 33, scope: !161)
!213 = !DILocation(line: 213, column: 12, scope: !214)
!214 = distinct !DILexicalBlock(scope: !161, file: !3, line: 213, column: 12)
!215 = !DILocation(line: 213, column: 19, scope: !214)
!216 = !DILocation(line: 213, column: 12, scope: !161)
!217 = !DILocation(line: 214, column: 28, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !3, line: 213, column: 30)
!219 = !DILocation(line: 215, column: 9, scope: !218)
!220 = !DILocation(line: 217, column: 32, scope: !221)
!221 = distinct !DILexicalBlock(scope: !214, file: !3, line: 216, column: 13)
!222 = !DILocation(line: 217, column: 14, scope: !221)
!223 = !DILocation(line: 217, column: 30, scope: !221)
!224 = !DILocation(line: 218, column: 13, scope: !221)
!225 = distinct !{!225, !157, !226}
!226 = !DILocation(line: 220, column: 5, scope: !142)
!227 = !DILocation(line: 221, column: 5, scope: !142)
!228 = !DILocation(line: 222, column: 1, scope: !142)
!229 = distinct !DISubprogram(name: "_rpc_get_a_remote_call", scope: !3, file: !3, line: 224, type: !230, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!230 = !DISubroutineType(types: !231)
!231 = !{!22, !43, !232, !33, !33, !6, !6}
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!233 = !DILocalVariable(name: "reqId", arg: 1, scope: !229, file: !3, line: 224, type: !43)
!234 = !DILocation(line: 224, column: 40, scope: !229)
!235 = !DILocalVariable(name: "result", arg: 2, scope: !229, file: !3, line: 224, type: !232)
!236 = !DILocation(line: 224, column: 55, scope: !229)
!237 = !DILocalVariable(name: "psocket", arg: 3, scope: !229, file: !3, line: 224, type: !33)
!238 = !DILocation(line: 224, column: 69, scope: !229)
!239 = !DILocalVariable(name: "ssocket", arg: 4, scope: !229, file: !3, line: 224, type: !33)
!240 = !DILocation(line: 224, column: 84, scope: !229)
!241 = !DILocalVariable(name: "t_tag", arg: 5, scope: !229, file: !3, line: 224, type: !6)
!242 = !DILocation(line: 224, column: 103, scope: !229)
!243 = !DILocalVariable(name: "o_tag", arg: 6, scope: !229, file: !3, line: 224, type: !6)
!244 = !DILocation(line: 224, column: 120, scope: !229)
!245 = !DILocalVariable(name: "tries_remaining", scope: !229, file: !3, line: 225, type: !43)
!246 = !DILocation(line: 225, column: 9, scope: !229)
!247 = !DILocation(line: 226, column: 5, scope: !229)
!248 = !DILocation(line: 226, column: 11, scope: !229)
!249 = !DILocation(line: 226, column: 26, scope: !229)
!250 = !DILocalVariable(name: "req_get_a", scope: !251, file: !3, line: 229, type: !162)
!251 = distinct !DILexicalBlock(scope: !229, file: !3, line: 226, column: 30)
!252 = !DILocation(line: 229, column: 32, scope: !251)
!253 = !DILocation(line: 229, column: 9, scope: !251)
!254 = !DILocalVariable(name: "res_get_a", scope: !251, file: !3, line: 235, type: !170)
!255 = !DILocation(line: 235, column: 33, scope: !251)
!256 = !DILocation(line: 235, column: 9, scope: !251)
!257 = !DILocation(line: 239, column: 19, scope: !251)
!258 = !DILocation(line: 239, column: 25, scope: !251)
!259 = !DILocation(line: 240, column: 33, scope: !251)
!260 = !DILocation(line: 240, column: 19, scope: !251)
!261 = !DILocation(line: 240, column: 27, scope: !251)
!262 = !DILocation(line: 240, column: 31, scope: !251)
!263 = !DILocation(line: 241, column: 23, scope: !251)
!264 = !DILocation(line: 241, column: 32, scope: !251)
!265 = !DILocation(line: 241, column: 44, scope: !251)
!266 = !DILocation(line: 241, column: 9, scope: !251)
!267 = !DILocalVariable(name: "status", scope: !251, file: !3, line: 242, type: !43)
!268 = !DILocation(line: 242, column: 13, scope: !251)
!269 = !DILocation(line: 242, column: 31, scope: !251)
!270 = !DILocation(line: 242, column: 40, scope: !251)
!271 = !DILocation(line: 242, column: 52, scope: !251)
!272 = !DILocation(line: 242, column: 22, scope: !251)
!273 = !DILocalVariable(name: "respId", scope: !251, file: !3, line: 243, type: !43)
!274 = !DILocation(line: 243, column: 13, scope: !251)
!275 = !DILocation(line: 243, column: 32, scope: !251)
!276 = !DILocation(line: 243, column: 40, scope: !251)
!277 = !DILocation(line: 243, column: 44, scope: !251)
!278 = !DILocalVariable(name: "error", scope: !251, file: !3, line: 244, type: !200)
!279 = !DILocation(line: 244, column: 14, scope: !251)
!280 = !DILocation(line: 244, column: 33, scope: !251)
!281 = !DILocation(line: 244, column: 41, scope: !251)
!282 = !DILocation(line: 244, column: 45, scope: !251)
!283 = !DILocation(line: 244, column: 50, scope: !251)
!284 = !DILocation(line: 244, column: 22, scope: !251)
!285 = !DILocalVariable(name: "callee_restarted", scope: !251, file: !3, line: 245, type: !200)
!286 = !DILocation(line: 245, column: 14, scope: !251)
!287 = !DILocation(line: 245, column: 43, scope: !251)
!288 = !DILocation(line: 245, column: 51, scope: !251)
!289 = !DILocation(line: 245, column: 55, scope: !251)
!290 = !DILocation(line: 245, column: 33, scope: !251)
!291 = !DILocation(line: 246, column: 12, scope: !292)
!292 = distinct !DILexicalBlock(scope: !251, file: !3, line: 246, column: 12)
!293 = !DILocation(line: 246, column: 19, scope: !292)
!294 = !DILocation(line: 246, column: 12, scope: !251)
!295 = !DILocation(line: 247, column: 28, scope: !296)
!296 = distinct !DILexicalBlock(scope: !292, file: !3, line: 246, column: 30)
!297 = !DILocation(line: 248, column: 9, scope: !296)
!298 = !DILocation(line: 250, column: 16, scope: !299)
!299 = distinct !DILexicalBlock(scope: !300, file: !3, line: 250, column: 16)
!300 = distinct !DILexicalBlock(scope: !292, file: !3, line: 249, column: 13)
!301 = !DILocation(line: 250, column: 25, scope: !299)
!302 = !DILocation(line: 250, column: 23, scope: !299)
!303 = !DILocation(line: 250, column: 16, scope: !300)
!304 = !DILocation(line: 251, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !299, file: !3, line: 250, column: 31)
!306 = distinct !{!306, !247, !307}
!307 = !DILocation(line: 263, column: 5, scope: !229)
!308 = !DILocation(line: 253, column: 16, scope: !309)
!309 = distinct !DILexicalBlock(scope: !300, file: !3, line: 253, column: 16)
!310 = !DILocation(line: 253, column: 16, scope: !300)
!311 = !DILocation(line: 254, column: 17, scope: !312)
!312 = distinct !DILexicalBlock(scope: !309, file: !3, line: 253, column: 22)
!313 = !DILocation(line: 256, column: 16, scope: !314)
!314 = distinct !DILexicalBlock(scope: !300, file: !3, line: 256, column: 16)
!315 = !DILocation(line: 256, column: 16, scope: !300)
!316 = !DILocation(line: 257, column: 37, scope: !317)
!317 = distinct !DILexicalBlock(scope: !314, file: !3, line: 256, column: 33)
!318 = !DILocation(line: 257, column: 18, scope: !317)
!319 = !DILocation(line: 257, column: 25, scope: !317)
!320 = !DILocation(line: 258, column: 17, scope: !317)
!321 = !DILocation(line: 260, column: 33, scope: !300)
!322 = !DILocation(line: 260, column: 14, scope: !300)
!323 = !DILocation(line: 260, column: 21, scope: !300)
!324 = !DILocation(line: 261, column: 13, scope: !300)
!325 = !DILocation(line: 264, column: 5, scope: !229)
!326 = !DILocation(line: 265, column: 1, scope: !229)
!327 = !DILocalVariable(name: "error", arg: 1, scope: !38, file: !3, line: 266, type: !42)
!328 = !DILocation(line: 266, column: 24, scope: !38)
!329 = !DILocalVariable(name: "restarted", arg: 2, scope: !38, file: !3, line: 266, type: !42)
!330 = !DILocation(line: 266, column: 36, scope: !38)
!331 = !DILocalVariable(name: "t_tag", scope: !38, file: !3, line: 283, type: !7)
!332 = !DILocation(line: 283, column: 14, scope: !38)
!333 = !DILocalVariable(name: "o_tag", scope: !38, file: !3, line: 284, type: !7)
!334 = !DILocation(line: 284, column: 14, scope: !38)
!335 = !DILocalVariable(name: "req_get_a", scope: !38, file: !3, line: 288, type: !162)
!336 = !DILocation(line: 288, column: 28, scope: !38)
!337 = !DILocation(line: 288, column: 5, scope: !38)
!338 = !DILocation(line: 294, column: 5, scope: !38)
!339 = !DILocalVariable(name: "res_get_a", scope: !38, file: !3, line: 298, type: !170)
!340 = !DILocation(line: 298, column: 29, scope: !38)
!341 = !DILocation(line: 298, column: 5, scope: !38)
!342 = !DILocation(line: 304, column: 5, scope: !38)
!343 = !DILocation(line: 312, column: 10, scope: !344)
!344 = distinct !DILexicalBlock(scope: !38, file: !3, line: 312, column: 9)
!345 = !DILocation(line: 312, column: 9, scope: !38)
!346 = !DILocation(line: 313, column: 16, scope: !347)
!347 = distinct !DILexicalBlock(scope: !344, file: !3, line: 312, column: 18)
!348 = !DILocation(line: 314, column: 19, scope: !347)
!349 = !DILocation(line: 314, column: 17, scope: !347)
!350 = !DILocation(line: 315, column: 19, scope: !347)
!351 = !DILocation(line: 315, column: 17, scope: !347)
!352 = !DILocation(line: 316, column: 9, scope: !347)
!353 = !DILocalVariable(name: "status", scope: !347, file: !3, line: 317, type: !43)
!354 = !DILocation(line: 317, column: 13, scope: !347)
!355 = !DILocation(line: 317, column: 72, scope: !347)
!356 = !DILocation(line: 317, column: 81, scope: !347)
!357 = !DILocation(line: 317, column: 22, scope: !347)
!358 = !DILocation(line: 318, column: 12, scope: !359)
!359 = distinct !DILexicalBlock(scope: !347, file: !3, line: 318, column: 12)
!360 = !DILocation(line: 318, column: 19, scope: !359)
!361 = !DILocation(line: 318, column: 12, scope: !347)
!362 = !DILocation(line: 319, column: 14, scope: !363)
!363 = distinct !DILexicalBlock(scope: !359, file: !3, line: 318, column: 29)
!364 = !DILocation(line: 319, column: 20, scope: !363)
!365 = !DILocation(line: 320, column: 13, scope: !363)
!366 = !DILocation(line: 322, column: 5, scope: !347)
!367 = !DILocation(line: 323, column: 20, scope: !38)
!368 = !DILocation(line: 334, column: 19, scope: !38)
!369 = !DILocation(line: 334, column: 28, scope: !38)
!370 = !DILocation(line: 334, column: 5, scope: !38)
!371 = !DILocalVariable(name: "result", scope: !38, file: !3, line: 336, type: !41)
!372 = !DILocation(line: 336, column: 12, scope: !38)
!373 = !DILocalVariable(name: "status", scope: !38, file: !3, line: 337, type: !22)
!374 = !DILocation(line: 337, column: 17, scope: !38)
!375 = !DILocation(line: 337, column: 49, scope: !38)
!376 = !DILocation(line: 337, column: 76, scope: !38)
!377 = !DILocation(line: 337, column: 85, scope: !38)
!378 = !DILocation(line: 337, column: 26, scope: !38)
!379 = !DILocation(line: 338, column: 8, scope: !380)
!380 = distinct !DILexicalBlock(scope: !38, file: !3, line: 338, column: 8)
!381 = !DILocation(line: 338, column: 15, scope: !380)
!382 = !DILocation(line: 338, column: 8, scope: !38)
!383 = !DILocation(line: 339, column: 10, scope: !384)
!384 = distinct !DILexicalBlock(scope: !380, file: !3, line: 338, column: 25)
!385 = !DILocation(line: 339, column: 16, scope: !384)
!386 = !DILocation(line: 340, column: 9, scope: !384)
!387 = !DILocation(line: 342, column: 8, scope: !388)
!388 = distinct !DILexicalBlock(scope: !38, file: !3, line: 342, column: 8)
!389 = !DILocation(line: 342, column: 15, scope: !388)
!390 = !DILocation(line: 342, column: 8, scope: !38)
!391 = !DILocation(line: 343, column: 10, scope: !392)
!392 = distinct !DILexicalBlock(scope: !388, file: !3, line: 342, column: 28)
!393 = !DILocation(line: 343, column: 20, scope: !392)
!394 = !DILocation(line: 344, column: 5, scope: !392)
!395 = !DILocation(line: 348, column: 13, scope: !38)
!396 = !DILocation(line: 348, column: 5, scope: !38)
!397 = !DILocation(line: 352, column: 1, scope: !38)
!398 = distinct !DISubprogram(name: "_master_rpc_init", scope: !3, file: !3, line: 354, type: !399, scopeLine: 354, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!399 = !DISubroutineType(types: !400)
!400 = !{null}
!401 = !DILocation(line: 355, column: 5, scope: !398)
!402 = !DILocation(line: 356, column: 1, scope: !398)
