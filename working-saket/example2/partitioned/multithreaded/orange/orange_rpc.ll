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
define dso_local i32 @_rpc_get_ewma_sync_request_counter(i32* %0, i8* %1, i8* %2, %struct._tag* %3, %struct._tag* %4, double %5) #0 !dbg !142 {
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
  %19 = alloca i8, align 1
  %20 = alloca i8, align 1
  store i32* %0, i32** %8, align 8
  call void @llvm.dbg.declare(metadata i32** %8, metadata !145, metadata !DIExpression()), !dbg !146
  store i8* %1, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !147, metadata !DIExpression()), !dbg !148
  store i8* %2, i8** %10, align 8
  call void @llvm.dbg.declare(metadata i8** %10, metadata !149, metadata !DIExpression()), !dbg !150
  store %struct._tag* %3, %struct._tag** %11, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %11, metadata !151, metadata !DIExpression()), !dbg !152
  store %struct._tag* %4, %struct._tag** %12, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %12, metadata !153, metadata !DIExpression()), !dbg !154
  store double %5, double* %13, align 8
  call void @llvm.dbg.declare(metadata double* %13, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i32* %14, metadata !157, metadata !DIExpression()), !dbg !158
  store i32 30, i32* %14, align 4, !dbg !158
  br label %21, !dbg !159

21:                                               ; preds = %65, %6
  %22 = load i32, i32* %14, align 4, !dbg !160
  %23 = icmp ne i32 %22, 0, !dbg !161
  br i1 %23, label %24, label %66, !dbg !159

24:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %15, metadata !162, metadata !DIExpression()), !dbg !169
  %25 = bitcast %struct._request_get_ewma_datatype* %15 to i8*, !dbg !170
  call void @llvm.var.annotation(i8* %25, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 196), !dbg !170
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %16, metadata !171, metadata !DIExpression()), !dbg !177
  %26 = bitcast %struct._response_get_ewma_datatype* %16 to i8*, !dbg !178
  call void @llvm.var.annotation(i8* %26, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 202), !dbg !178
  %27 = load double, double* %13, align 8, !dbg !179
  %28 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %15, i32 0, i32 0, !dbg !180
  store double %27, double* %28, align 1, !dbg !181
  %29 = load i32*, i32** %8, align 8, !dbg !182
  %30 = load i32, i32* %29, align 4, !dbg !183
  %31 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %15, i32 0, i32 1, !dbg !184
  %32 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %31, i32 0, i32 0, !dbg !185
  store i32 %30, i32* %32, align 1, !dbg !186
  %33 = load i8*, i8** %9, align 8, !dbg !187
  %34 = bitcast %struct._request_get_ewma_datatype* %15 to i8*, !dbg !188
  %35 = load %struct._tag*, %struct._tag** %11, align 8, !dbg !189
  call void @xdc_asyn_send(i8* %33, i8* %34, %struct._tag* %35), !dbg !190
  call void @llvm.dbg.declare(metadata i32* %17, metadata !191, metadata !DIExpression()), !dbg !192
  %36 = load i8*, i8** %10, align 8, !dbg !193
  %37 = bitcast %struct._response_get_ewma_datatype* %16 to i8*, !dbg !194
  %38 = load %struct._tag*, %struct._tag** %12, align 8, !dbg !195
  %39 = call i32 @xdc_recv(i8* %36, i8* %37, %struct._tag* %38), !dbg !196
  store i32 %39, i32* %17, align 4, !dbg !192
  call void @llvm.dbg.declare(metadata i32* %18, metadata !197, metadata !DIExpression()), !dbg !198
  %40 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 1, !dbg !199
  %41 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %40, i32 0, i32 0, !dbg !200
  %42 = load i32, i32* %41, align 1, !dbg !200
  %43 = lshr i32 %42, 2, !dbg !201
  store i32 %43, i32* %18, align 4, !dbg !198
  call void @llvm.dbg.declare(metadata i8* %19, metadata !202, metadata !DIExpression()), !dbg !204
  %44 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 1, !dbg !205
  %45 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %44, i32 0, i32 0, !dbg !206
  %46 = load i32, i32* %45, align 1, !dbg !206
  %47 = lshr i32 %46, 1, !dbg !207
  %48 = and i32 %47, 1, !dbg !208
  %49 = icmp ne i32 %48, 0, !dbg !209
  %50 = zext i1 %49 to i8, !dbg !204
  store i8 %50, i8* %19, align 1, !dbg !204
  call void @llvm.dbg.declare(metadata i8* %20, metadata !210, metadata !DIExpression()), !dbg !211
  %51 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %16, i32 0, i32 1, !dbg !212
  %52 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %51, i32 0, i32 0, !dbg !213
  %53 = load i32, i32* %52, align 1, !dbg !213
  %54 = and i32 %53, 1, !dbg !214
  %55 = icmp ne i32 %54, 0, !dbg !215
  %56 = zext i1 %55 to i8, !dbg !211
  store i8 %56, i8* %20, align 1, !dbg !211
  %57 = load i32, i32* %17, align 4, !dbg !216
  %58 = icmp eq i32 %57, -1, !dbg !218
  br i1 %58, label %59, label %62, !dbg !219

59:                                               ; preds = %24
  %60 = load i32, i32* %14, align 4, !dbg !220
  %61 = add nsw i32 %60, -1, !dbg !220
  store i32 %61, i32* %14, align 4, !dbg !220
  br label %65, !dbg !222

62:                                               ; preds = %24
  %63 = load i32, i32* %18, align 4, !dbg !223
  %64 = load i32*, i32** %8, align 8, !dbg !225
  store i32 %63, i32* %64, align 4, !dbg !226
  store i32 1, i32* %7, align 4, !dbg !227
  br label %67, !dbg !227

65:                                               ; preds = %59
  br label %21, !dbg !159, !llvm.loop !228

66:                                               ; preds = %21
  store i32 0, i32* %7, align 4, !dbg !230
  br label %67, !dbg !230

67:                                               ; preds = %66, %62
  %68 = load i32, i32* %7, align 4, !dbg !231
  ret i32 %68, !dbg !231
}

declare dso_local i32 @xdc_recv(i8*, i8*, %struct._tag*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_rpc_get_ewma_remote_call(i32 %0, double* %1, i8* %2, i8* %3, %struct._tag* %4, %struct._tag* %5, double %6) #0 !dbg !232 {
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
  %21 = alloca i8, align 1
  %22 = alloca i8, align 1
  store i32 %0, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !236, metadata !DIExpression()), !dbg !237
  store double* %1, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !238, metadata !DIExpression()), !dbg !239
  store i8* %2, i8** %11, align 8
  call void @llvm.dbg.declare(metadata i8** %11, metadata !240, metadata !DIExpression()), !dbg !241
  store i8* %3, i8** %12, align 8
  call void @llvm.dbg.declare(metadata i8** %12, metadata !242, metadata !DIExpression()), !dbg !243
  store %struct._tag* %4, %struct._tag** %13, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %13, metadata !244, metadata !DIExpression()), !dbg !245
  store %struct._tag* %5, %struct._tag** %14, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %14, metadata !246, metadata !DIExpression()), !dbg !247
  store double %6, double* %15, align 8
  call void @llvm.dbg.declare(metadata double* %15, metadata !248, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.declare(metadata i32* %16, metadata !250, metadata !DIExpression()), !dbg !251
  store i32 30, i32* %16, align 4, !dbg !251
  br label %23, !dbg !252

23:                                               ; preds = %83, %67, %7
  %24 = load i32, i32* %16, align 4, !dbg !253
  %25 = icmp ne i32 %24, 0, !dbg !254
  br i1 %25, label %26, label %84, !dbg !252

26:                                               ; preds = %23
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %17, metadata !255, metadata !DIExpression()), !dbg !257
  %27 = bitcast %struct._request_get_ewma_datatype* %17 to i8*, !dbg !258
  call void @llvm.var.annotation(i8* %27, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 231), !dbg !258
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %18, metadata !259, metadata !DIExpression()), !dbg !260
  %28 = bitcast %struct._response_get_ewma_datatype* %18 to i8*, !dbg !261
  call void @llvm.var.annotation(i8* %28, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 237), !dbg !261
  %29 = load double, double* %15, align 8, !dbg !262
  %30 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %17, i32 0, i32 0, !dbg !263
  store double %29, double* %30, align 1, !dbg !264
  %31 = load i32, i32* %9, align 4, !dbg !265
  %32 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %17, i32 0, i32 1, !dbg !266
  %33 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %32, i32 0, i32 0, !dbg !267
  store i32 %31, i32* %33, align 1, !dbg !268
  %34 = load i8*, i8** %11, align 8, !dbg !269
  %35 = bitcast %struct._request_get_ewma_datatype* %17 to i8*, !dbg !270
  %36 = load %struct._tag*, %struct._tag** %13, align 8, !dbg !271
  call void @xdc_asyn_send(i8* %34, i8* %35, %struct._tag* %36), !dbg !272
  call void @llvm.dbg.declare(metadata i32* %19, metadata !273, metadata !DIExpression()), !dbg !274
  %37 = load i8*, i8** %12, align 8, !dbg !275
  %38 = bitcast %struct._response_get_ewma_datatype* %18 to i8*, !dbg !276
  %39 = load %struct._tag*, %struct._tag** %14, align 8, !dbg !277
  %40 = call i32 @xdc_recv(i8* %37, i8* %38, %struct._tag* %39), !dbg !278
  store i32 %40, i32* %19, align 4, !dbg !274
  call void @llvm.dbg.declare(metadata i32* %20, metadata !279, metadata !DIExpression()), !dbg !280
  %41 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %18, i32 0, i32 1, !dbg !281
  %42 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %41, i32 0, i32 0, !dbg !282
  %43 = load i32, i32* %42, align 1, !dbg !282
  %44 = lshr i32 %43, 2, !dbg !283
  store i32 %44, i32* %20, align 4, !dbg !280
  call void @llvm.dbg.declare(metadata i8* %21, metadata !284, metadata !DIExpression()), !dbg !285
  %45 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %18, i32 0, i32 1, !dbg !286
  %46 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %45, i32 0, i32 0, !dbg !287
  %47 = load i32, i32* %46, align 1, !dbg !287
  %48 = lshr i32 %47, 1, !dbg !288
  %49 = and i32 %48, 1, !dbg !289
  %50 = icmp ne i32 %49, 0, !dbg !290
  %51 = zext i1 %50 to i8, !dbg !285
  store i8 %51, i8* %21, align 1, !dbg !285
  call void @llvm.dbg.declare(metadata i8* %22, metadata !291, metadata !DIExpression()), !dbg !292
  %52 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %18, i32 0, i32 1, !dbg !293
  %53 = getelementptr inbounds %struct._trailer_datatype, %struct._trailer_datatype* %52, i32 0, i32 0, !dbg !294
  %54 = load i32, i32* %53, align 1, !dbg !294
  %55 = and i32 %54, 1, !dbg !295
  %56 = icmp ne i32 %55, 0, !dbg !296
  %57 = zext i1 %56 to i8, !dbg !292
  store i8 %57, i8* %22, align 1, !dbg !292
  %58 = load i32, i32* %19, align 4, !dbg !297
  %59 = icmp eq i32 %58, -1, !dbg !299
  br i1 %59, label %60, label %63, !dbg !300

60:                                               ; preds = %26
  %61 = load i32, i32* %16, align 4, !dbg !301
  %62 = add nsw i32 %61, -1, !dbg !301
  store i32 %62, i32* %16, align 4, !dbg !301
  br label %83, !dbg !303

63:                                               ; preds = %26
  %64 = load i32, i32* %20, align 4, !dbg !304
  %65 = load i32, i32* %9, align 4, !dbg !307
  %66 = icmp slt i32 %64, %65, !dbg !308
  br i1 %66, label %67, label %68, !dbg !309

67:                                               ; preds = %63
  br label %23, !dbg !310, !llvm.loop !312

68:                                               ; preds = %63
  %69 = load i8, i8* %21, align 1, !dbg !314
  %70 = trunc i8 %69 to i1, !dbg !314
  br i1 %70, label %71, label %72, !dbg !316

71:                                               ; preds = %68
  store i32 0, i32* %8, align 4, !dbg !317
  br label %85, !dbg !317

72:                                               ; preds = %68
  %73 = load i8, i8* %22, align 1, !dbg !319
  %74 = trunc i8 %73 to i1, !dbg !319
  br i1 %74, label %75, label %79, !dbg !321

75:                                               ; preds = %72
  %76 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %18, i32 0, i32 0, !dbg !322
  %77 = load double, double* %76, align 1, !dbg !322
  %78 = load double*, double** %10, align 8, !dbg !324
  store double %77, double* %78, align 8, !dbg !325
  store i32 2, i32* %8, align 4, !dbg !326
  br label %85, !dbg !326

79:                                               ; preds = %72
  %80 = getelementptr inbounds %struct._response_get_ewma_datatype, %struct._response_get_ewma_datatype* %18, i32 0, i32 0, !dbg !327
  %81 = load double, double* %80, align 1, !dbg !327
  %82 = load double*, double** %10, align 8, !dbg !328
  store double %81, double* %82, align 8, !dbg !329
  store i32 1, i32* %8, align 4, !dbg !330
  br label %85, !dbg !330

83:                                               ; preds = %60
  br label %23, !dbg !252, !llvm.loop !312

84:                                               ; preds = %23
  store i32 0, i32* %8, align 4, !dbg !331
  br label %85, !dbg !331

85:                                               ; preds = %84, %79, %75, %71
  %86 = load i32, i32* %8, align 4, !dbg !332
  ret i32 %86, !dbg !332
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
  call void @llvm.dbg.declare(metadata double* %5, metadata !333, metadata !DIExpression()), !dbg !334
  store i32* %1, i32** %6, align 8
  call void @llvm.dbg.declare(metadata i32** %6, metadata !335, metadata !DIExpression()), !dbg !336
  store i32* %2, i32** %7, align 8
  call void @llvm.dbg.declare(metadata i32** %7, metadata !337, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.declare(metadata %struct._tag* %8, metadata !339, metadata !DIExpression()), !dbg !340
  call void @llvm.dbg.declare(metadata %struct._tag* %9, metadata !341, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.declare(metadata %struct._request_get_ewma_datatype* %10, metadata !343, metadata !DIExpression()), !dbg !344
  %16 = bitcast %struct._request_get_ewma_datatype* %10 to i8*, !dbg !345
  call void @llvm.var.annotation(i8* %16, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 292), !dbg !345
  call void @tag_write(%struct._tag* %8, i32 1, i32 1, i32 3), !dbg !346
  call void @llvm.dbg.declare(metadata %struct._response_get_ewma_datatype* %11, metadata !347, metadata !DIExpression()), !dbg !348
  %17 = bitcast %struct._response_get_ewma_datatype* %11 to i8*, !dbg !349
  call void @llvm.var.annotation(i8* %17, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 302), !dbg !349
  call void @tag_write(%struct._tag* %9, i32 2, i32 2, i32 4), !dbg !350
  %18 = load double, double* %5, align 8, !dbg !351
  %19 = getelementptr inbounds %struct._request_get_ewma_datatype, %struct._request_get_ewma_datatype* %10, i32 0, i32 0, !dbg !352
  store double %18, double* %19, align 1, !dbg !353
  %20 = load i32, i32* @_rpc_get_ewma.inited, align 4, !dbg !354
  %21 = icmp ne i32 %20, 0, !dbg !354
  br i1 %21, label %41, label %22, !dbg !356

22:                                               ; preds = %3
  store i32 1, i32* @_rpc_get_ewma.inited, align 4, !dbg !357
  %23 = call i8* @xdc_pub_socket(), !dbg !359
  store i8* %23, i8** @_rpc_get_ewma.psocket, align 8, !dbg !360
  %24 = bitcast { i64, i32 }* %12 to i8*, !dbg !361
  %25 = bitcast %struct._tag* %9 to i8*, !dbg !361
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %24, i8* align 1 %25, i64 12, i1 false), !dbg !361
  %26 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %12, i32 0, i32 0, !dbg !361
  %27 = load i64, i64* %26, align 1, !dbg !361
  %28 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %12, i32 0, i32 1, !dbg !361
  %29 = load i32, i32* %28, align 1, !dbg !361
  %30 = call i8* @xdc_sub_socket_non_blocking(i64 %27, i32 %29, i32 1000), !dbg !361
  store i8* %30, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !362
  %31 = call i32 @sleep(i32 1), !dbg !363
  call void @llvm.dbg.declare(metadata i32* %13, metadata !364, metadata !DIExpression()), !dbg !365
  %32 = load i8*, i8** @_rpc_get_ewma.psocket, align 8, !dbg !366
  %33 = load i8*, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !367
  %34 = load double, double* %5, align 8, !dbg !368
  %35 = call i32 @_rpc_get_ewma_sync_request_counter(i32* @_rpc_get_ewma.request_counter, i8* %32, i8* %33, %struct._tag* %8, %struct._tag* %9, double %34), !dbg !369
  store i32 %35, i32* %13, align 4, !dbg !365
  %36 = load i32, i32* %13, align 4, !dbg !370
  %37 = icmp eq i32 %36, 0, !dbg !372
  br i1 %37, label %38, label %40, !dbg !373

38:                                               ; preds = %22
  %39 = load i32*, i32** %6, align 8, !dbg !374
  store i32 1, i32* %39, align 4, !dbg !376
  store double 0.000000e+00, double* %4, align 8, !dbg !377
  br label %60, !dbg !377

40:                                               ; preds = %22
  br label %41, !dbg !378

41:                                               ; preds = %40, %3
  %42 = load i32, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !379
  %43 = add nsw i32 %42, 1, !dbg !379
  store i32 %43, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !379
  call void @llvm.dbg.declare(metadata double* %14, metadata !380, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.declare(metadata i32* %15, metadata !382, metadata !DIExpression()), !dbg !383
  %44 = load i32, i32* @_rpc_get_ewma.request_counter, align 4, !dbg !384
  %45 = load i8*, i8** @_rpc_get_ewma.psocket, align 8, !dbg !385
  %46 = load i8*, i8** @_rpc_get_ewma.ssocket, align 8, !dbg !386
  %47 = load double, double* %5, align 8, !dbg !387
  %48 = call i32 @_rpc_get_ewma_remote_call(i32 %44, double* %14, i8* %45, i8* %46, %struct._tag* %8, %struct._tag* %9, double %47), !dbg !388
  store i32 %48, i32* %15, align 4, !dbg !383
  %49 = load i32, i32* %15, align 4, !dbg !389
  %50 = icmp eq i32 %49, 0, !dbg !391
  br i1 %50, label %51, label %53, !dbg !392

51:                                               ; preds = %41
  %52 = load i32*, i32** %6, align 8, !dbg !393
  store i32 1, i32* %52, align 4, !dbg !395
  store double 0.000000e+00, double* %4, align 8, !dbg !396
  br label %60, !dbg !396

53:                                               ; preds = %41
  %54 = load i32, i32* %15, align 4, !dbg !397
  %55 = icmp eq i32 %54, 2, !dbg !399
  br i1 %55, label %56, label %58, !dbg !400

56:                                               ; preds = %53
  %57 = load i32*, i32** %7, align 8, !dbg !401
  store i32 1, i32* %57, align 4, !dbg !403
  br label %58, !dbg !404

58:                                               ; preds = %56, %53
  %59 = load double, double* %14, align 8, !dbg !405
  store double %59, double* %4, align 8, !dbg !406
  br label %60, !dbg !406

60:                                               ; preds = %58, %51, %38
  %61 = load double, double* %4, align 8, !dbg !407
  ret double %61, !dbg !407
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_master_rpc_init() #0 !dbg !408 {
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0)), !dbg !411
  ret void, !dbg !412
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
!37 = distinct !DIGlobalVariable(name: "inited", scope: !38, file: !3, line: 283, type: !43, isLocal: true, isDefinition: true)
!38 = distinct !DISubprogram(name: "_rpc_get_ewma", scope: !3, file: !3, line: 270, type: !39, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!39 = !DISubroutineType(types: !40)
!40 = !{!41, !41, !42, !42}
!41 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !{}
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(name: "psocket", scope: !38, file: !3, line: 284, type: !33, isLocal: true, isDefinition: true)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "ssocket", scope: !38, file: !3, line: 285, type: !33, isLocal: true, isDefinition: true)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(name: "request_counter", scope: !38, file: !3, line: 286, type: !43, isLocal: true, isDefinition: true)
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
!144 = !{!22, !42, !33, !33, !6, !6, !41}
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
!155 = !DILocalVariable(name: "x", arg: 6, scope: !142, file: !3, line: 191, type: !41)
!156 = !DILocation(line: 191, column: 140, scope: !142)
!157 = !DILocalVariable(name: "tries_remaining", scope: !142, file: !3, line: 192, type: !43)
!158 = !DILocation(line: 192, column: 9, scope: !142)
!159 = !DILocation(line: 193, column: 5, scope: !142)
!160 = !DILocation(line: 193, column: 11, scope: !142)
!161 = !DILocation(line: 193, column: 27, scope: !142)
!162 = !DILocalVariable(name: "req_get_ewma", scope: !163, file: !3, line: 196, type: !164)
!163 = distinct !DILexicalBlock(scope: !142, file: !3, line: 193, column: 32)
!164 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_ewma_datatype", file: !79, line: 61, baseType: !165)
!165 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_ewma_datatype", file: !79, line: 58, size: 192, elements: !166)
!166 = !{!167, !168}
!167 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !165, file: !79, line: 59, baseType: !41, size: 64)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !165, file: !79, line: 60, baseType: !89, size: 128, offset: 64)
!169 = !DILocation(line: 196, column: 35, scope: !163)
!170 = !DILocation(line: 196, column: 9, scope: !163)
!171 = !DILocalVariable(name: "res_get_ewma", scope: !163, file: !3, line: 202, type: !172)
!172 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_ewma_datatype", file: !79, line: 71, baseType: !173)
!173 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_ewma_datatype", file: !79, line: 68, size: 192, elements: !174)
!174 = !{!175, !176}
!175 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !173, file: !79, line: 69, baseType: !41, size: 64)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !173, file: !79, line: 70, baseType: !89, size: 128, offset: 64)
!177 = !DILocation(line: 202, column: 36, scope: !163)
!178 = !DILocation(line: 202, column: 9, scope: !163)
!179 = !DILocation(line: 206, column: 26, scope: !163)
!180 = !DILocation(line: 206, column: 22, scope: !163)
!181 = !DILocation(line: 206, column: 24, scope: !163)
!182 = !DILocation(line: 207, column: 37, scope: !163)
!183 = !DILocation(line: 207, column: 36, scope: !163)
!184 = !DILocation(line: 207, column: 22, scope: !163)
!185 = !DILocation(line: 207, column: 30, scope: !163)
!186 = !DILocation(line: 207, column: 34, scope: !163)
!187 = !DILocation(line: 208, column: 23, scope: !163)
!188 = !DILocation(line: 208, column: 32, scope: !163)
!189 = !DILocation(line: 208, column: 47, scope: !163)
!190 = !DILocation(line: 208, column: 9, scope: !163)
!191 = !DILocalVariable(name: "status", scope: !163, file: !3, line: 210, type: !43)
!192 = !DILocation(line: 210, column: 13, scope: !163)
!193 = !DILocation(line: 210, column: 31, scope: !163)
!194 = !DILocation(line: 210, column: 40, scope: !163)
!195 = !DILocation(line: 210, column: 55, scope: !163)
!196 = !DILocation(line: 210, column: 22, scope: !163)
!197 = !DILocalVariable(name: "respId", scope: !163, file: !3, line: 212, type: !43)
!198 = !DILocation(line: 212, column: 13, scope: !163)
!199 = !DILocation(line: 212, column: 35, scope: !163)
!200 = !DILocation(line: 212, column: 43, scope: !163)
!201 = !DILocation(line: 212, column: 47, scope: !163)
!202 = !DILocalVariable(name: "error", scope: !163, file: !3, line: 213, type: !203)
!203 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!204 = !DILocation(line: 213, column: 14, scope: !163)
!205 = !DILocation(line: 213, column: 36, scope: !163)
!206 = !DILocation(line: 213, column: 44, scope: !163)
!207 = !DILocation(line: 213, column: 48, scope: !163)
!208 = !DILocation(line: 213, column: 53, scope: !163)
!209 = !DILocation(line: 213, column: 22, scope: !163)
!210 = !DILocalVariable(name: "callee_restarted", scope: !163, file: !3, line: 214, type: !203)
!211 = !DILocation(line: 214, column: 14, scope: !163)
!212 = !DILocation(line: 214, column: 46, scope: !163)
!213 = !DILocation(line: 214, column: 54, scope: !163)
!214 = !DILocation(line: 214, column: 58, scope: !163)
!215 = !DILocation(line: 214, column: 33, scope: !163)
!216 = !DILocation(line: 215, column: 12, scope: !217)
!217 = distinct !DILexicalBlock(scope: !163, file: !3, line: 215, column: 12)
!218 = !DILocation(line: 215, column: 19, scope: !217)
!219 = !DILocation(line: 215, column: 12, scope: !163)
!220 = !DILocation(line: 216, column: 28, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !3, line: 215, column: 30)
!222 = !DILocation(line: 217, column: 9, scope: !221)
!223 = !DILocation(line: 219, column: 32, scope: !224)
!224 = distinct !DILexicalBlock(scope: !217, file: !3, line: 218, column: 13)
!225 = !DILocation(line: 219, column: 14, scope: !224)
!226 = !DILocation(line: 219, column: 30, scope: !224)
!227 = !DILocation(line: 220, column: 13, scope: !224)
!228 = distinct !{!228, !159, !229}
!229 = !DILocation(line: 222, column: 5, scope: !142)
!230 = !DILocation(line: 223, column: 5, scope: !142)
!231 = !DILocation(line: 224, column: 1, scope: !142)
!232 = distinct !DISubprogram(name: "_rpc_get_ewma_remote_call", scope: !3, file: !3, line: 226, type: !233, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!233 = !DISubroutineType(types: !234)
!234 = !{!22, !43, !235, !33, !33, !6, !6, !41}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!236 = !DILocalVariable(name: "reqId", arg: 1, scope: !232, file: !3, line: 226, type: !43)
!237 = !DILocation(line: 226, column: 43, scope: !232)
!238 = !DILocalVariable(name: "result", arg: 2, scope: !232, file: !3, line: 226, type: !235)
!239 = !DILocation(line: 226, column: 58, scope: !232)
!240 = !DILocalVariable(name: "psocket", arg: 3, scope: !232, file: !3, line: 226, type: !33)
!241 = !DILocation(line: 226, column: 72, scope: !232)
!242 = !DILocalVariable(name: "ssocket", arg: 4, scope: !232, file: !3, line: 226, type: !33)
!243 = !DILocation(line: 226, column: 87, scope: !232)
!244 = !DILocalVariable(name: "t_tag", arg: 5, scope: !232, file: !3, line: 226, type: !6)
!245 = !DILocation(line: 226, column: 106, scope: !232)
!246 = !DILocalVariable(name: "o_tag", arg: 6, scope: !232, file: !3, line: 226, type: !6)
!247 = !DILocation(line: 226, column: 123, scope: !232)
!248 = !DILocalVariable(name: "x", arg: 7, scope: !232, file: !3, line: 226, type: !41)
!249 = !DILocation(line: 226, column: 136, scope: !232)
!250 = !DILocalVariable(name: "tries_remaining", scope: !232, file: !3, line: 227, type: !43)
!251 = !DILocation(line: 227, column: 9, scope: !232)
!252 = !DILocation(line: 228, column: 5, scope: !232)
!253 = !DILocation(line: 228, column: 11, scope: !232)
!254 = !DILocation(line: 228, column: 26, scope: !232)
!255 = !DILocalVariable(name: "req_get_ewma", scope: !256, file: !3, line: 231, type: !164)
!256 = distinct !DILexicalBlock(scope: !232, file: !3, line: 228, column: 30)
!257 = !DILocation(line: 231, column: 35, scope: !256)
!258 = !DILocation(line: 231, column: 9, scope: !256)
!259 = !DILocalVariable(name: "res_get_ewma", scope: !256, file: !3, line: 237, type: !172)
!260 = !DILocation(line: 237, column: 36, scope: !256)
!261 = !DILocation(line: 237, column: 9, scope: !256)
!262 = !DILocation(line: 241, column: 26, scope: !256)
!263 = !DILocation(line: 241, column: 22, scope: !256)
!264 = !DILocation(line: 241, column: 24, scope: !256)
!265 = !DILocation(line: 242, column: 36, scope: !256)
!266 = !DILocation(line: 242, column: 22, scope: !256)
!267 = !DILocation(line: 242, column: 30, scope: !256)
!268 = !DILocation(line: 242, column: 34, scope: !256)
!269 = !DILocation(line: 243, column: 23, scope: !256)
!270 = !DILocation(line: 243, column: 32, scope: !256)
!271 = !DILocation(line: 243, column: 47, scope: !256)
!272 = !DILocation(line: 243, column: 9, scope: !256)
!273 = !DILocalVariable(name: "status", scope: !256, file: !3, line: 245, type: !43)
!274 = !DILocation(line: 245, column: 13, scope: !256)
!275 = !DILocation(line: 245, column: 31, scope: !256)
!276 = !DILocation(line: 245, column: 40, scope: !256)
!277 = !DILocation(line: 245, column: 55, scope: !256)
!278 = !DILocation(line: 245, column: 22, scope: !256)
!279 = !DILocalVariable(name: "respId", scope: !256, file: !3, line: 247, type: !43)
!280 = !DILocation(line: 247, column: 13, scope: !256)
!281 = !DILocation(line: 247, column: 35, scope: !256)
!282 = !DILocation(line: 247, column: 43, scope: !256)
!283 = !DILocation(line: 247, column: 47, scope: !256)
!284 = !DILocalVariable(name: "error", scope: !256, file: !3, line: 248, type: !203)
!285 = !DILocation(line: 248, column: 14, scope: !256)
!286 = !DILocation(line: 248, column: 36, scope: !256)
!287 = !DILocation(line: 248, column: 44, scope: !256)
!288 = !DILocation(line: 248, column: 48, scope: !256)
!289 = !DILocation(line: 248, column: 53, scope: !256)
!290 = !DILocation(line: 248, column: 22, scope: !256)
!291 = !DILocalVariable(name: "callee_restarted", scope: !256, file: !3, line: 249, type: !203)
!292 = !DILocation(line: 249, column: 14, scope: !256)
!293 = !DILocation(line: 249, column: 46, scope: !256)
!294 = !DILocation(line: 249, column: 54, scope: !256)
!295 = !DILocation(line: 249, column: 58, scope: !256)
!296 = !DILocation(line: 249, column: 33, scope: !256)
!297 = !DILocation(line: 250, column: 12, scope: !298)
!298 = distinct !DILexicalBlock(scope: !256, file: !3, line: 250, column: 12)
!299 = !DILocation(line: 250, column: 19, scope: !298)
!300 = !DILocation(line: 250, column: 12, scope: !256)
!301 = !DILocation(line: 251, column: 28, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !3, line: 250, column: 30)
!303 = !DILocation(line: 252, column: 9, scope: !302)
!304 = !DILocation(line: 254, column: 16, scope: !305)
!305 = distinct !DILexicalBlock(scope: !306, file: !3, line: 254, column: 16)
!306 = distinct !DILexicalBlock(scope: !298, file: !3, line: 253, column: 13)
!307 = !DILocation(line: 254, column: 25, scope: !305)
!308 = !DILocation(line: 254, column: 23, scope: !305)
!309 = !DILocation(line: 254, column: 16, scope: !306)
!310 = !DILocation(line: 255, column: 17, scope: !311)
!311 = distinct !DILexicalBlock(scope: !305, file: !3, line: 254, column: 31)
!312 = distinct !{!312, !252, !313}
!313 = !DILocation(line: 267, column: 5, scope: !232)
!314 = !DILocation(line: 257, column: 16, scope: !315)
!315 = distinct !DILexicalBlock(scope: !306, file: !3, line: 257, column: 16)
!316 = !DILocation(line: 257, column: 16, scope: !306)
!317 = !DILocation(line: 258, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !315, file: !3, line: 257, column: 22)
!319 = !DILocation(line: 260, column: 16, scope: !320)
!320 = distinct !DILexicalBlock(scope: !306, file: !3, line: 260, column: 16)
!321 = !DILocation(line: 260, column: 16, scope: !306)
!322 = !DILocation(line: 261, column: 40, scope: !323)
!323 = distinct !DILexicalBlock(scope: !320, file: !3, line: 260, column: 33)
!324 = !DILocation(line: 261, column: 18, scope: !323)
!325 = !DILocation(line: 261, column: 25, scope: !323)
!326 = !DILocation(line: 262, column: 17, scope: !323)
!327 = !DILocation(line: 264, column: 36, scope: !306)
!328 = !DILocation(line: 264, column: 14, scope: !306)
!329 = !DILocation(line: 264, column: 21, scope: !306)
!330 = !DILocation(line: 265, column: 13, scope: !306)
!331 = !DILocation(line: 268, column: 5, scope: !232)
!332 = !DILocation(line: 269, column: 1, scope: !232)
!333 = !DILocalVariable(name: "x", arg: 1, scope: !38, file: !3, line: 270, type: !41)
!334 = !DILocation(line: 270, column: 29, scope: !38)
!335 = !DILocalVariable(name: "error", arg: 2, scope: !38, file: !3, line: 270, type: !42)
!336 = !DILocation(line: 270, column: 37, scope: !38)
!337 = !DILocalVariable(name: "restarted", arg: 3, scope: !38, file: !3, line: 270, type: !42)
!338 = !DILocation(line: 270, column: 49, scope: !38)
!339 = !DILocalVariable(name: "t_tag", scope: !38, file: !3, line: 287, type: !7)
!340 = !DILocation(line: 287, column: 14, scope: !38)
!341 = !DILocalVariable(name: "o_tag", scope: !38, file: !3, line: 288, type: !7)
!342 = !DILocation(line: 288, column: 14, scope: !38)
!343 = !DILocalVariable(name: "req_get_ewma", scope: !38, file: !3, line: 292, type: !164)
!344 = !DILocation(line: 292, column: 31, scope: !38)
!345 = !DILocation(line: 292, column: 5, scope: !38)
!346 = !DILocation(line: 298, column: 5, scope: !38)
!347 = !DILocalVariable(name: "res_get_ewma", scope: !38, file: !3, line: 302, type: !172)
!348 = !DILocation(line: 302, column: 32, scope: !38)
!349 = !DILocation(line: 302, column: 5, scope: !38)
!350 = !DILocation(line: 308, column: 5, scope: !38)
!351 = !DILocation(line: 310, column: 22, scope: !38)
!352 = !DILocation(line: 310, column: 18, scope: !38)
!353 = !DILocation(line: 310, column: 20, scope: !38)
!354 = !DILocation(line: 317, column: 10, scope: !355)
!355 = distinct !DILexicalBlock(scope: !38, file: !3, line: 317, column: 9)
!356 = !DILocation(line: 317, column: 9, scope: !38)
!357 = !DILocation(line: 318, column: 16, scope: !358)
!358 = distinct !DILexicalBlock(scope: !355, file: !3, line: 317, column: 18)
!359 = !DILocation(line: 319, column: 19, scope: !358)
!360 = !DILocation(line: 319, column: 17, scope: !358)
!361 = !DILocation(line: 320, column: 19, scope: !358)
!362 = !DILocation(line: 320, column: 17, scope: !358)
!363 = !DILocation(line: 321, column: 9, scope: !358)
!364 = !DILocalVariable(name: "status", scope: !358, file: !3, line: 322, type: !43)
!365 = !DILocation(line: 322, column: 13, scope: !358)
!366 = !DILocation(line: 322, column: 75, scope: !358)
!367 = !DILocation(line: 322, column: 84, scope: !358)
!368 = !DILocation(line: 322, column: 108, scope: !358)
!369 = !DILocation(line: 322, column: 22, scope: !358)
!370 = !DILocation(line: 323, column: 12, scope: !371)
!371 = distinct !DILexicalBlock(scope: !358, file: !3, line: 323, column: 12)
!372 = !DILocation(line: 323, column: 19, scope: !371)
!373 = !DILocation(line: 323, column: 12, scope: !358)
!374 = !DILocation(line: 324, column: 14, scope: !375)
!375 = distinct !DILexicalBlock(scope: !371, file: !3, line: 323, column: 29)
!376 = !DILocation(line: 324, column: 20, scope: !375)
!377 = !DILocation(line: 325, column: 13, scope: !375)
!378 = !DILocation(line: 327, column: 5, scope: !358)
!379 = !DILocation(line: 328, column: 20, scope: !38)
!380 = !DILocalVariable(name: "result", scope: !38, file: !3, line: 339, type: !41)
!381 = !DILocation(line: 339, column: 12, scope: !38)
!382 = !DILocalVariable(name: "status", scope: !38, file: !3, line: 340, type: !22)
!383 = !DILocation(line: 340, column: 17, scope: !38)
!384 = !DILocation(line: 340, column: 52, scope: !38)
!385 = !DILocation(line: 340, column: 79, scope: !38)
!386 = !DILocation(line: 340, column: 88, scope: !38)
!387 = !DILocation(line: 340, column: 112, scope: !38)
!388 = !DILocation(line: 340, column: 26, scope: !38)
!389 = !DILocation(line: 341, column: 8, scope: !390)
!390 = distinct !DILexicalBlock(scope: !38, file: !3, line: 341, column: 8)
!391 = !DILocation(line: 341, column: 15, scope: !390)
!392 = !DILocation(line: 341, column: 8, scope: !38)
!393 = !DILocation(line: 342, column: 10, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !3, line: 341, column: 25)
!395 = !DILocation(line: 342, column: 16, scope: !394)
!396 = !DILocation(line: 343, column: 9, scope: !394)
!397 = !DILocation(line: 345, column: 8, scope: !398)
!398 = distinct !DILexicalBlock(scope: !38, file: !3, line: 345, column: 8)
!399 = !DILocation(line: 345, column: 15, scope: !398)
!400 = !DILocation(line: 345, column: 8, scope: !38)
!401 = !DILocation(line: 346, column: 10, scope: !402)
!402 = distinct !DILexicalBlock(scope: !398, file: !3, line: 345, column: 28)
!403 = !DILocation(line: 346, column: 20, scope: !402)
!404 = !DILocation(line: 347, column: 5, scope: !402)
!405 = !DILocation(line: 350, column: 13, scope: !38)
!406 = !DILocation(line: 350, column: 5, scope: !38)
!407 = !DILocation(line: 354, column: 1, scope: !38)
!408 = distinct !DISubprogram(name: "_master_rpc_init", scope: !3, file: !3, line: 356, type: !409, scopeLine: 356, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !44)
!409 = !DISubroutineType(types: !410)
!410 = !{null}
!411 = !DILocation(line: 357, column: 5, scope: !408)
!412 = !DILocation(line: 358, column: 1, scope: !408)
