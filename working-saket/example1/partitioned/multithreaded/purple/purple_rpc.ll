; ModuleID = './partitioned/multithreaded/purple/purple_rpc.c'
source_filename = "./partitioned/multithreaded/purple/purple_rpc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type <{ i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }>
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct._codec_map = type <{ i32, void (i8*, i8*, i64*)*, void (i8*, i8*, i64*)* }>
%struct._tag = type { i32, i32, i32 }
%struct._sdh_ha_v1 = type { %struct._tag, i32, [2000 x i8] }
%struct._nextrpc_datatype = type { i32, i32, i32, %struct._trailer_datatype }
%struct._trailer_datatype = type { i32, i32, i32, i16, i16 }
%struct._okay_datatype = type { i32, %struct._trailer_datatype }
%struct._request_get_a_datatype = type { i32, %struct._trailer_datatype }
%struct._response_get_a_datatype = type { double, %struct._trailer_datatype }

@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [18 x i8] c"send error %s %d \00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_pubpurple\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_subpurple\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"err == 0\00", align 1
@.str.4 = private unnamed_addr constant [48 x i8] c"./partitioned/multithreaded/purple/purple_rpc.c\00", align 1
@__PRETTY_FUNCTION__.my_xdc_sub_socket = private unnamed_addr constant [42 x i8] c"void *my_xdc_sub_socket(gaps_tag, void *)\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"TAG_NEXTRPC\00", section "llvm.metadata"
@.str.6 = private unnamed_addr constant [48 x i8] c"./partitioned/multithreaded/purple/purple_rpc.c\00", section "llvm.metadata"
@.str.7 = private unnamed_addr constant [9 x i8] c"TAG_OKAY\00", section "llvm.metadata"
@.str.8 = private unnamed_addr constant [18 x i8] c"TAG_REQUEST_GET_A\00", section "llvm.metadata"
@.str.9 = private unnamed_addr constant [19 x i8] c"TAG_RESPONSE_GET_A\00", section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @my_type_check(i32 %0, %struct._codec_map* %1) #0 !dbg !16 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._codec_map*, align 8
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !37, metadata !DIExpression()), !dbg !38
  store %struct._codec_map* %1, %struct._codec_map** %4, align 8
  call void @llvm.dbg.declare(metadata %struct._codec_map** %4, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i32, i32* %3, align 4, !dbg !41
  %6 = icmp uge i32 %5, 200, !dbg !43
  br i1 %6, label %15, label %7, !dbg !44

7:                                                ; preds = %2
  %8 = load %struct._codec_map*, %struct._codec_map** %4, align 8, !dbg !45
  %9 = load i32, i32* %3, align 4, !dbg !46
  %10 = zext i32 %9 to i64, !dbg !45
  %11 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %8, i64 %10, !dbg !45
  %12 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %11, i32 0, i32 0, !dbg !47
  %13 = load i32, i32* %12, align 1, !dbg !47
  %14 = icmp eq i32 %13, 0, !dbg !48
  br i1 %14, label %15, label %16, !dbg !49

15:                                               ; preds = %7, %2
  call void @exit(i32 1) #7, !dbg !50
  unreachable, !dbg !50

16:                                               ; preds = %7
  ret void, !dbg !52
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @my_xdc_register(void (i8*, i8*, i64*)* %0, void (i8*, i8*, i64*)* %1, i32 %2, %struct._codec_map* %3) #0 !dbg !53 {
  %5 = alloca void (i8*, i8*, i64*)*, align 8
  %6 = alloca void (i8*, i8*, i64*)*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct._codec_map*, align 8
  store void (i8*, i8*, i64*)* %0, void (i8*, i8*, i64*)** %5, align 8
  call void @llvm.dbg.declare(metadata void (i8*, i8*, i64*)** %5, metadata !56, metadata !DIExpression()), !dbg !57
  store void (i8*, i8*, i64*)* %1, void (i8*, i8*, i64*)** %6, align 8
  call void @llvm.dbg.declare(metadata void (i8*, i8*, i64*)** %6, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !60, metadata !DIExpression()), !dbg !61
  store %struct._codec_map* %3, %struct._codec_map** %8, align 8
  call void @llvm.dbg.declare(metadata %struct._codec_map** %8, metadata !62, metadata !DIExpression()), !dbg !63
  %9 = load %struct._codec_map*, %struct._codec_map** %8, align 8, !dbg !64
  %10 = load i32, i32* %7, align 4, !dbg !65
  %11 = sext i32 %10 to i64, !dbg !64
  %12 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %9, i64 %11, !dbg !64
  %13 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %12, i32 0, i32 0, !dbg !66
  store i32 1, i32* %13, align 1, !dbg !67
  %14 = load void (i8*, i8*, i64*)*, void (i8*, i8*, i64*)** %5, align 8, !dbg !68
  %15 = load %struct._codec_map*, %struct._codec_map** %8, align 8, !dbg !69
  %16 = load i32, i32* %7, align 4, !dbg !70
  %17 = sext i32 %16 to i64, !dbg !69
  %18 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %15, i64 %17, !dbg !69
  %19 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %18, i32 0, i32 1, !dbg !71
  store void (i8*, i8*, i64*)* %14, void (i8*, i8*, i64*)** %19, align 1, !dbg !72
  %20 = load void (i8*, i8*, i64*)*, void (i8*, i8*, i64*)** %6, align 8, !dbg !73
  %21 = load %struct._codec_map*, %struct._codec_map** %8, align 8, !dbg !74
  %22 = load i32, i32* %7, align 4, !dbg !75
  %23 = sext i32 %22 to i64, !dbg !74
  %24 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %21, i64 %23, !dbg !74
  %25 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %24, i32 0, i32 2, !dbg !76
  store void (i8*, i8*, i64*)* %20, void (i8*, i8*, i64*)** %25, align 1, !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @my_tag_encode(%struct._tag* %0, %struct._tag* %1) #0 !dbg !79 {
  %3 = alloca %struct._tag*, align 8
  %4 = alloca %struct._tag*, align 8
  store %struct._tag* %0, %struct._tag** %3, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %3, metadata !89, metadata !DIExpression()), !dbg !90
  store %struct._tag* %1, %struct._tag** %4, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %4, metadata !91, metadata !DIExpression()), !dbg !92
  %5 = load %struct._tag*, %struct._tag** %4, align 8, !dbg !93
  %6 = getelementptr inbounds %struct._tag, %struct._tag* %5, i32 0, i32 0, !dbg !94
  %7 = load i32, i32* %6, align 1, !dbg !94
  %8 = call i32 @htonl(i32 %7) #8, !dbg !95
  %9 = load %struct._tag*, %struct._tag** %3, align 8, !dbg !96
  %10 = getelementptr inbounds %struct._tag, %struct._tag* %9, i32 0, i32 0, !dbg !97
  store i32 %8, i32* %10, align 1, !dbg !98
  %11 = load %struct._tag*, %struct._tag** %4, align 8, !dbg !99
  %12 = getelementptr inbounds %struct._tag, %struct._tag* %11, i32 0, i32 1, !dbg !100
  %13 = load i32, i32* %12, align 1, !dbg !100
  %14 = call i32 @htonl(i32 %13) #8, !dbg !101
  %15 = load %struct._tag*, %struct._tag** %3, align 8, !dbg !102
  %16 = getelementptr inbounds %struct._tag, %struct._tag* %15, i32 0, i32 1, !dbg !103
  store i32 %14, i32* %16, align 1, !dbg !104
  %17 = load %struct._tag*, %struct._tag** %4, align 8, !dbg !105
  %18 = getelementptr inbounds %struct._tag, %struct._tag* %17, i32 0, i32 2, !dbg !106
  %19 = load i32, i32* %18, align 1, !dbg !106
  %20 = call i32 @htonl(i32 %19) #8, !dbg !107
  %21 = load %struct._tag*, %struct._tag** %3, align 8, !dbg !108
  %22 = getelementptr inbounds %struct._tag, %struct._tag* %21, i32 0, i32 2, !dbg !109
  store i32 %20, i32* %22, align 1, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: nounwind readnone
declare dso_local i32 @htonl(i32) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @my_tag_decode(%struct._tag* %0, %struct._tag* %1) #0 !dbg !112 {
  %3 = alloca %struct._tag*, align 8
  %4 = alloca %struct._tag*, align 8
  store %struct._tag* %0, %struct._tag** %3, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %3, metadata !113, metadata !DIExpression()), !dbg !114
  store %struct._tag* %1, %struct._tag** %4, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %4, metadata !115, metadata !DIExpression()), !dbg !116
  %5 = load %struct._tag*, %struct._tag** %4, align 8, !dbg !117
  %6 = getelementptr inbounds %struct._tag, %struct._tag* %5, i32 0, i32 0, !dbg !118
  %7 = load i32, i32* %6, align 1, !dbg !118
  %8 = call i32 @ntohl(i32 %7) #8, !dbg !119
  %9 = load %struct._tag*, %struct._tag** %3, align 8, !dbg !120
  %10 = getelementptr inbounds %struct._tag, %struct._tag* %9, i32 0, i32 0, !dbg !121
  store i32 %8, i32* %10, align 1, !dbg !122
  %11 = load %struct._tag*, %struct._tag** %4, align 8, !dbg !123
  %12 = getelementptr inbounds %struct._tag, %struct._tag* %11, i32 0, i32 1, !dbg !124
  %13 = load i32, i32* %12, align 1, !dbg !124
  %14 = call i32 @ntohl(i32 %13) #8, !dbg !125
  %15 = load %struct._tag*, %struct._tag** %3, align 8, !dbg !126
  %16 = getelementptr inbounds %struct._tag, %struct._tag* %15, i32 0, i32 1, !dbg !127
  store i32 %14, i32* %16, align 1, !dbg !128
  %17 = load %struct._tag*, %struct._tag** %4, align 8, !dbg !129
  %18 = getelementptr inbounds %struct._tag, %struct._tag* %17, i32 0, i32 2, !dbg !130
  %19 = load i32, i32* %18, align 1, !dbg !130
  %20 = call i32 @ntohl(i32 %19) #8, !dbg !131
  %21 = load %struct._tag*, %struct._tag** %3, align 8, !dbg !132
  %22 = getelementptr inbounds %struct._tag, %struct._tag* %21, i32 0, i32 2, !dbg !133
  store i32 %20, i32* %22, align 1, !dbg !134
  ret void, !dbg !135
}

; Function Attrs: nounwind readnone
declare dso_local i32 @ntohl(i32) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @my_len_encode(i32* %0, i64 %1) #0 !dbg !136 {
  %3 = alloca i32*, align 8
  %4 = alloca i64, align 8
  store i32* %0, i32** %3, align 8
  call void @llvm.dbg.declare(metadata i32** %3, metadata !140, metadata !DIExpression()), !dbg !141
  store i64 %1, i64* %4, align 8
  call void @llvm.dbg.declare(metadata i64* %4, metadata !142, metadata !DIExpression()), !dbg !143
  %5 = load i64, i64* %4, align 8, !dbg !144
  %6 = trunc i64 %5 to i32, !dbg !145
  %7 = call i32 @ntohl(i32 %6) #8, !dbg !146
  %8 = load i32*, i32** %3, align 8, !dbg !147
  store i32 %7, i32* %8, align 4, !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @my_len_decode(i64* %0, i32 %1) #0 !dbg !150 {
  %3 = alloca i64*, align 8
  %4 = alloca i32, align 4
  store i64* %0, i64** %3, align 8
  call void @llvm.dbg.declare(metadata i64** %3, metadata !153, metadata !DIExpression()), !dbg !154
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !155, metadata !DIExpression()), !dbg !156
  %5 = load i32, i32* %4, align 4, !dbg !157
  %6 = call i32 @htonl(i32 %5) #8, !dbg !158
  %7 = zext i32 %6 to i64, !dbg !159
  %8 = load i64*, i64** %3, align 8, !dbg !160
  store i64 %7, i64* %8, align 8, !dbg !161
  ret void, !dbg !162
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @my_gaps_data_encode(%struct._sdh_ha_v1* %0, i64* %1, i8* %2, i64* %3, %struct._tag* %4, %struct._codec_map* %5) #0 !dbg !163 {
  %7 = alloca %struct._sdh_ha_v1*, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i64*, align 8
  %11 = alloca %struct._tag*, align 8
  %12 = alloca %struct._codec_map*, align 8
  %13 = alloca i32, align 4
  store %struct._sdh_ha_v1* %0, %struct._sdh_ha_v1** %7, align 8
  call void @llvm.dbg.declare(metadata %struct._sdh_ha_v1** %7, metadata !180, metadata !DIExpression()), !dbg !181
  store i64* %1, i64** %8, align 8
  call void @llvm.dbg.declare(metadata i64** %8, metadata !182, metadata !DIExpression()), !dbg !183
  store i8* %2, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !184, metadata !DIExpression()), !dbg !185
  store i64* %3, i64** %10, align 8
  call void @llvm.dbg.declare(metadata i64** %10, metadata !186, metadata !DIExpression()), !dbg !187
  store %struct._tag* %4, %struct._tag** %11, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %11, metadata !188, metadata !DIExpression()), !dbg !189
  store %struct._codec_map* %5, %struct._codec_map** %12, align 8
  call void @llvm.dbg.declare(metadata %struct._codec_map** %12, metadata !190, metadata !DIExpression()), !dbg !191
  call void @llvm.dbg.declare(metadata i32* %13, metadata !192, metadata !DIExpression()), !dbg !193
  %14 = load %struct._tag*, %struct._tag** %11, align 8, !dbg !194
  %15 = getelementptr inbounds %struct._tag, %struct._tag* %14, i32 0, i32 2, !dbg !195
  %16 = load i32, i32* %15, align 1, !dbg !195
  store i32 %16, i32* %13, align 4, !dbg !193
  %17 = load i32, i32* %13, align 4, !dbg !196
  %18 = load %struct._codec_map*, %struct._codec_map** %12, align 8, !dbg !197
  call void @my_type_check(i32 %17, %struct._codec_map* %18), !dbg !198
  %19 = load %struct._codec_map*, %struct._codec_map** %12, align 8, !dbg !199
  %20 = load i32, i32* %13, align 4, !dbg !200
  %21 = zext i32 %20 to i64, !dbg !199
  %22 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %19, i64 %21, !dbg !199
  %23 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %22, i32 0, i32 1, !dbg !201
  %24 = load void (i8*, i8*, i64*)*, void (i8*, i8*, i64*)** %23, align 1, !dbg !201
  %25 = load %struct._sdh_ha_v1*, %struct._sdh_ha_v1** %7, align 8, !dbg !202
  %26 = getelementptr inbounds %struct._sdh_ha_v1, %struct._sdh_ha_v1* %25, i32 0, i32 2, !dbg !203
  %27 = getelementptr inbounds [2000 x i8], [2000 x i8]* %26, i64 0, i64 0, !dbg !202
  %28 = load i8*, i8** %9, align 8, !dbg !204
  %29 = load i64*, i64** %10, align 8, !dbg !205
  call void %24(i8* %27, i8* %28, i64* %29), !dbg !199
  %30 = load %struct._sdh_ha_v1*, %struct._sdh_ha_v1** %7, align 8, !dbg !206
  %31 = getelementptr inbounds %struct._sdh_ha_v1, %struct._sdh_ha_v1* %30, i32 0, i32 0, !dbg !207
  %32 = load %struct._tag*, %struct._tag** %11, align 8, !dbg !208
  call void @my_tag_encode(%struct._tag* %31, %struct._tag* %32), !dbg !209
  %33 = load %struct._sdh_ha_v1*, %struct._sdh_ha_v1** %7, align 8, !dbg !210
  %34 = getelementptr inbounds %struct._sdh_ha_v1, %struct._sdh_ha_v1* %33, i32 0, i32 1, !dbg !211
  %35 = load i64*, i64** %10, align 8, !dbg !212
  %36 = load i64, i64* %35, align 8, !dbg !213
  call void @my_len_encode(i32* %34, i64 %36), !dbg !214
  %37 = load i64*, i64** %10, align 8, !dbg !215
  %38 = load i64, i64* %37, align 8, !dbg !216
  %39 = add i64 %38, 12, !dbg !217
  %40 = add i64 %39, 4, !dbg !218
  %41 = load i64*, i64** %8, align 8, !dbg !219
  store i64 %40, i64* %41, align 8, !dbg !220
  ret void, !dbg !221
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @my_gaps_data_decode(%struct._sdh_ha_v1* %0, i64 %1, i8* %2, i64* %3, %struct._tag* %4, %struct._codec_map* %5) #0 !dbg !222 {
  %7 = alloca %struct._sdh_ha_v1*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i64*, align 8
  %11 = alloca %struct._tag*, align 8
  %12 = alloca %struct._codec_map*, align 8
  %13 = alloca i32, align 4
  store %struct._sdh_ha_v1* %0, %struct._sdh_ha_v1** %7, align 8
  call void @llvm.dbg.declare(metadata %struct._sdh_ha_v1** %7, metadata !225, metadata !DIExpression()), !dbg !226
  store i64 %1, i64* %8, align 8
  call void @llvm.dbg.declare(metadata i64* %8, metadata !227, metadata !DIExpression()), !dbg !228
  store i8* %2, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !229, metadata !DIExpression()), !dbg !230
  store i64* %3, i64** %10, align 8
  call void @llvm.dbg.declare(metadata i64** %10, metadata !231, metadata !DIExpression()), !dbg !232
  store %struct._tag* %4, %struct._tag** %11, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %11, metadata !233, metadata !DIExpression()), !dbg !234
  store %struct._codec_map* %5, %struct._codec_map** %12, align 8
  call void @llvm.dbg.declare(metadata %struct._codec_map** %12, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata i32* %13, metadata !237, metadata !DIExpression()), !dbg !238
  %14 = load %struct._tag*, %struct._tag** %11, align 8, !dbg !239
  %15 = getelementptr inbounds %struct._tag, %struct._tag* %14, i32 0, i32 2, !dbg !240
  %16 = load i32, i32* %15, align 1, !dbg !240
  store i32 %16, i32* %13, align 4, !dbg !238
  %17 = load i32, i32* %13, align 4, !dbg !241
  %18 = load %struct._codec_map*, %struct._codec_map** %12, align 8, !dbg !242
  call void @my_type_check(i32 %17, %struct._codec_map* %18), !dbg !243
  %19 = load %struct._tag*, %struct._tag** %11, align 8, !dbg !244
  %20 = load %struct._sdh_ha_v1*, %struct._sdh_ha_v1** %7, align 8, !dbg !245
  %21 = getelementptr inbounds %struct._sdh_ha_v1, %struct._sdh_ha_v1* %20, i32 0, i32 0, !dbg !246
  call void @my_tag_decode(%struct._tag* %19, %struct._tag* %21), !dbg !247
  %22 = load i64*, i64** %10, align 8, !dbg !248
  %23 = load %struct._sdh_ha_v1*, %struct._sdh_ha_v1** %7, align 8, !dbg !249
  %24 = getelementptr inbounds %struct._sdh_ha_v1, %struct._sdh_ha_v1* %23, i32 0, i32 1, !dbg !250
  %25 = load i32, i32* %24, align 1, !dbg !250
  call void @my_len_decode(i64* %22, i32 %25), !dbg !251
  %26 = load %struct._codec_map*, %struct._codec_map** %12, align 8, !dbg !252
  %27 = load i32, i32* %13, align 4, !dbg !253
  %28 = zext i32 %27 to i64, !dbg !252
  %29 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %26, i64 %28, !dbg !252
  %30 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %29, i32 0, i32 2, !dbg !254
  %31 = load void (i8*, i8*, i64*)*, void (i8*, i8*, i64*)** %30, align 1, !dbg !254
  %32 = load i8*, i8** %9, align 8, !dbg !255
  %33 = load %struct._sdh_ha_v1*, %struct._sdh_ha_v1** %7, align 8, !dbg !256
  %34 = getelementptr inbounds %struct._sdh_ha_v1, %struct._sdh_ha_v1* %33, i32 0, i32 2, !dbg !257
  %35 = getelementptr inbounds [2000 x i8], [2000 x i8]* %34, i64 0, i64 0, !dbg !256
  call void %31(i8* %32, i8* %35, i64* %8), !dbg !252
  ret void, !dbg !258
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @my_xdc_asyn_send(i8* %0, i8* %1, %struct._tag* %2, %struct._codec_map* %3) #0 !dbg !259 {
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct._tag*, align 8
  %8 = alloca %struct._codec_map*, align 8
  %9 = alloca %struct._sdh_ha_v1, align 1
  %10 = alloca %struct._sdh_ha_v1*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !262, metadata !DIExpression()), !dbg !263
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !264, metadata !DIExpression()), !dbg !265
  store %struct._tag* %2, %struct._tag** %7, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %7, metadata !266, metadata !DIExpression()), !dbg !267
  store %struct._codec_map* %3, %struct._codec_map** %8, align 8
  call void @llvm.dbg.declare(metadata %struct._codec_map** %8, metadata !268, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.declare(metadata %struct._sdh_ha_v1* %9, metadata !270, metadata !DIExpression()), !dbg !271
  call void @llvm.dbg.declare(metadata %struct._sdh_ha_v1** %10, metadata !272, metadata !DIExpression()), !dbg !273
  store %struct._sdh_ha_v1* %9, %struct._sdh_ha_v1** %10, align 8, !dbg !273
  call void @llvm.dbg.declare(metadata i64* %11, metadata !274, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata i64* %12, metadata !276, metadata !DIExpression()), !dbg !277
  %14 = load %struct._sdh_ha_v1*, %struct._sdh_ha_v1** %10, align 8, !dbg !278
  %15 = load i8*, i8** %6, align 8, !dbg !279
  %16 = load %struct._tag*, %struct._tag** %7, align 8, !dbg !280
  %17 = load %struct._codec_map*, %struct._codec_map** %8, align 8, !dbg !281
  call void @my_gaps_data_encode(%struct._sdh_ha_v1* %14, i64* %11, i8* %15, i64* %12, %struct._tag* %16, %struct._codec_map* %17), !dbg !282
  call void @llvm.dbg.declare(metadata i32* %13, metadata !283, metadata !DIExpression()), !dbg !284
  %18 = load i8*, i8** %5, align 8, !dbg !285
  %19 = load %struct._sdh_ha_v1*, %struct._sdh_ha_v1** %10, align 8, !dbg !286
  %20 = bitcast %struct._sdh_ha_v1* %19 to i8*, !dbg !287
  %21 = load i64, i64* %11, align 8, !dbg !288
  %22 = call i32 @zmq_send(i8* %18, i8* %20, i64 %21, i32 0), !dbg !289
  store i32 %22, i32* %13, align 4, !dbg !284
  %23 = load i32, i32* %13, align 4, !dbg !290
  %24 = icmp sle i32 %23, 0, !dbg !292
  br i1 %24, label %25, label %32, !dbg !293

25:                                               ; preds = %4
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !294
  %27 = call i32* @__errno_location() #8, !dbg !295
  %28 = load i32, i32* %27, align 4, !dbg !295
  %29 = call i8* @zmq_strerror(i32 %28), !dbg !296
  %30 = load i32, i32* %13, align 4, !dbg !297
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i8* %29, i32 %30), !dbg !298
  br label %32, !dbg !298

32:                                               ; preds = %25, %4
  ret void, !dbg !299
}

declare dso_local i32 @zmq_send(i8*, i8*, i64, i32) #4

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

declare dso_local i8* @zmq_strerror(i32) #4

; Function Attrs: nounwind readnone
declare dso_local i32* @__errno_location() #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @my_xdc_blocking_recv(i8* %0, i8* %1, %struct._tag* %2, %struct._codec_map* %3) #0 !dbg !300 {
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct._tag*, align 8
  %8 = alloca %struct._codec_map*, align 8
  %9 = alloca %struct._sdh_ha_v1, align 1
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  store i8* %0, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !301, metadata !DIExpression()), !dbg !302
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !303, metadata !DIExpression()), !dbg !304
  store %struct._tag* %2, %struct._tag** %7, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %7, metadata !305, metadata !DIExpression()), !dbg !306
  store %struct._codec_map* %3, %struct._codec_map** %8, align 8
  call void @llvm.dbg.declare(metadata %struct._codec_map** %8, metadata !307, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.declare(metadata %struct._sdh_ha_v1* %9, metadata !309, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.declare(metadata i8** %10, metadata !311, metadata !DIExpression()), !dbg !312
  %13 = bitcast %struct._sdh_ha_v1* %9 to i8*, !dbg !313
  store i8* %13, i8** %10, align 8, !dbg !312
  call void @llvm.dbg.declare(metadata i32* %11, metadata !314, metadata !DIExpression()), !dbg !315
  %14 = load i8*, i8** %5, align 8, !dbg !316
  %15 = load i8*, i8** %10, align 8, !dbg !317
  %16 = call i32 @zmq_recv(i8* %14, i8* %15, i64 2016, i32 0), !dbg !318
  store i32 %16, i32* %11, align 4, !dbg !315
  call void @llvm.dbg.declare(metadata i64* %12, metadata !319, metadata !DIExpression()), !dbg !320
  %17 = load i8*, i8** %10, align 8, !dbg !321
  %18 = bitcast i8* %17 to %struct._sdh_ha_v1*, !dbg !321
  %19 = load i32, i32* %11, align 4, !dbg !322
  %20 = sext i32 %19 to i64, !dbg !322
  %21 = load i8*, i8** %6, align 8, !dbg !323
  %22 = load %struct._tag*, %struct._tag** %7, align 8, !dbg !324
  %23 = load %struct._codec_map*, %struct._codec_map** %8, align 8, !dbg !325
  call void @my_gaps_data_decode(%struct._sdh_ha_v1* %18, i64 %20, i8* %21, i64* %12, %struct._tag* %22, %struct._codec_map* %23), !dbg !326
  ret void, !dbg !327
}

declare dso_local i32 @zmq_recv(i8*, i8*, i64, i32) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @my_xdc_pub_socket(i8* %0) #0 !dbg !328 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !331, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.declare(metadata i32* %3, metadata !333, metadata !DIExpression()), !dbg !334
  call void @llvm.dbg.declare(metadata i8** %4, metadata !335, metadata !DIExpression()), !dbg !336
  %5 = load i8*, i8** %2, align 8, !dbg !337
  %6 = call i8* @zmq_socket(i8* %5, i32 1), !dbg !338
  store i8* %6, i8** %4, align 8, !dbg !339
  %7 = load i8*, i8** %4, align 8, !dbg !340
  %8 = call i32 @zmq_connect(i8* %7, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0)), !dbg !341
  store i32 %8, i32* %3, align 4, !dbg !342
  %9 = load i8*, i8** %4, align 8, !dbg !343
  ret i8* %9, !dbg !344
}

declare dso_local i8* @zmq_socket(i8*, i32) #4

declare dso_local i32 @zmq_connect(i8*, i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @my_xdc_sub_socket(i64 %0, i32 %1, i8* %2) #0 !dbg !345 {
  %4 = alloca %struct._tag, align 1
  %5 = alloca { i64, i32 }, align 1
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct._tag, align 1
  %9 = alloca i8*, align 8
  %10 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %5, i32 0, i32 0
  store i64 %0, i64* %10, align 1
  %11 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %5, i32 0, i32 1
  store i32 %1, i32* %11, align 1
  %12 = bitcast %struct._tag* %4 to i8*
  %13 = bitcast { i64, i32 }* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %12, i8* align 1 %13, i64 12, i1 false)
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !348, metadata !DIExpression()), !dbg !349
  store i8* %2, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !350, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.declare(metadata i32* %7, metadata !352, metadata !DIExpression()), !dbg !353
  call void @llvm.dbg.declare(metadata %struct._tag* %8, metadata !354, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.declare(metadata i8** %9, metadata !356, metadata !DIExpression()), !dbg !357
  %14 = load i8*, i8** %6, align 8, !dbg !358
  %15 = call i8* @zmq_socket(i8* %14, i32 2), !dbg !359
  store i8* %15, i8** %9, align 8, !dbg !360
  %16 = load i8*, i8** %9, align 8, !dbg !361
  %17 = call i32 @zmq_connect(i8* %16, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i64 0, i64 0)), !dbg !362
  store i32 %17, i32* %7, align 4, !dbg !363
  call void @my_tag_encode(%struct._tag* %8, %struct._tag* %4), !dbg !364
  %18 = load i8*, i8** %9, align 8, !dbg !365
  %19 = bitcast %struct._tag* %8 to i8*, !dbg !366
  %20 = call i32 @zmq_setsockopt(i8* %18, i32 6, i8* %19, i64 12), !dbg !367
  store i32 %20, i32* %7, align 4, !dbg !368
  %21 = load i32, i32* %7, align 4, !dbg !369
  %22 = icmp eq i32 %21, 0, !dbg !369
  br i1 %22, label %23, label %24, !dbg !372

23:                                               ; preds = %3
  br label %25, !dbg !372

24:                                               ; preds = %3
  call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.4, i64 0, i64 0), i32 94, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__PRETTY_FUNCTION__.my_xdc_sub_socket, i64 0, i64 0)) #7, !dbg !369
  unreachable, !dbg !369

25:                                               ; preds = %23
  %26 = load i8*, i8** %9, align 8, !dbg !373
  ret i8* %26, !dbg !374
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local i32 @zmq_setsockopt(i8*, i32, i8*, i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @my_tag_write(%struct._tag* %0, i32 %1, i32 %2, i32 %3) #0 !dbg !375 {
  %5 = alloca %struct._tag*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct._tag* %0, %struct._tag** %5, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %5, metadata !378, metadata !DIExpression()), !dbg !379
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !380, metadata !DIExpression()), !dbg !381
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !382, metadata !DIExpression()), !dbg !383
  store i32 %3, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !384, metadata !DIExpression()), !dbg !385
  %9 = load i32, i32* %6, align 4, !dbg !386
  %10 = load %struct._tag*, %struct._tag** %5, align 8, !dbg !387
  %11 = getelementptr inbounds %struct._tag, %struct._tag* %10, i32 0, i32 0, !dbg !388
  store i32 %9, i32* %11, align 1, !dbg !389
  %12 = load i32, i32* %7, align 4, !dbg !390
  %13 = load %struct._tag*, %struct._tag** %5, align 8, !dbg !391
  %14 = getelementptr inbounds %struct._tag, %struct._tag* %13, i32 0, i32 1, !dbg !392
  store i32 %12, i32* %14, align 1, !dbg !393
  %15 = load i32, i32* %8, align 4, !dbg !394
  %16 = load %struct._tag*, %struct._tag** %5, align 8, !dbg !395
  %17 = getelementptr inbounds %struct._tag, %struct._tag* %16, i32 0, i32 2, !dbg !396
  store i32 %15, i32* %17, align 1, !dbg !397
  ret void, !dbg !398
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_hal_init(i8* %0, i8* %1) #0 !dbg !399 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !402, metadata !DIExpression()), !dbg !403
  store i8* %1, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !404, metadata !DIExpression()), !dbg !405
  ret void, !dbg !406
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_notify_next_tag(%struct._tag* %0) #0 !dbg !407 {
  %2 = alloca %struct._tag*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct._tag, align 1
  %6 = alloca %struct._tag, align 1
  %7 = alloca [200 x %struct._codec_map], align 16
  %8 = alloca i32, align 4
  %9 = alloca %struct._nextrpc_datatype, align 1
  %10 = alloca %struct._okay_datatype, align 1
  %11 = alloca i8*, align 8
  %12 = alloca { i64, i32 }, align 1
  store %struct._tag* %0, %struct._tag** %2, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !410, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.declare(metadata i8** %3, metadata !412, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.declare(metadata i8** %4, metadata !414, metadata !DIExpression()), !dbg !415
  call void @llvm.dbg.declare(metadata %struct._tag* %5, metadata !416, metadata !DIExpression()), !dbg !417
  call void @llvm.dbg.declare(metadata %struct._tag* %6, metadata !418, metadata !DIExpression()), !dbg !419
  call void @llvm.dbg.declare(metadata [200 x %struct._codec_map]* %7, metadata !420, metadata !DIExpression()), !dbg !424
  call void @llvm.dbg.declare(metadata i32* %8, metadata !425, metadata !DIExpression()), !dbg !427
  store i32 0, i32* %8, align 4, !dbg !427
  br label %13, !dbg !428

13:                                               ; preds = %21, %1
  %14 = load i32, i32* %8, align 4, !dbg !429
  %15 = icmp slt i32 %14, 200, !dbg !431
  br i1 %15, label %16, label %24, !dbg !432

16:                                               ; preds = %13
  %17 = load i32, i32* %8, align 4, !dbg !433
  %18 = sext i32 %17 to i64, !dbg !434
  %19 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %7, i64 0, i64 %18, !dbg !434
  %20 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %19, i32 0, i32 0, !dbg !435
  store i32 0, i32* %20, align 4, !dbg !436
  br label %21, !dbg !434

21:                                               ; preds = %16
  %22 = load i32, i32* %8, align 4, !dbg !437
  %23 = add nsw i32 %22, 1, !dbg !437
  store i32 %23, i32* %8, align 4, !dbg !437
  br label %13, !dbg !438, !llvm.loop !439

24:                                               ; preds = %13
  %25 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %7, i64 0, i64 0, !dbg !441
  call void @my_xdc_register(void (i8*, i8*, i64*)* @nextrpc_data_encode, void (i8*, i8*, i64*)* @nextrpc_data_decode, i32 1, %struct._codec_map* %25), !dbg !442
  %26 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %7, i64 0, i64 0, !dbg !443
  call void @my_xdc_register(void (i8*, i8*, i64*)* @okay_data_encode, void (i8*, i8*, i64*)* @okay_data_decode, i32 2, %struct._codec_map* %26), !dbg !444
  %27 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %7, i64 0, i64 0, !dbg !445
  call void @my_xdc_register(void (i8*, i8*, i64*)* @request_get_a_data_encode, void (i8*, i8*, i64*)* @request_get_a_data_decode, i32 3, %struct._codec_map* %27), !dbg !446
  %28 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %7, i64 0, i64 0, !dbg !447
  call void @my_xdc_register(void (i8*, i8*, i64*)* @response_get_a_data_encode, void (i8*, i8*, i64*)* @response_get_a_data_decode, i32 4, %struct._codec_map* %28), !dbg !448
  call void @llvm.dbg.declare(metadata %struct._nextrpc_datatype* %9, metadata !449, metadata !DIExpression()), !dbg !472
  %29 = bitcast %struct._nextrpc_datatype* %9 to i8*, !dbg !473
  call void @llvm.var.annotation(i8* %29, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.6, i32 0, i32 0), i32 138), !dbg !473
  call void @my_tag_write(%struct._tag* %5, i32 2, i32 2, i32 1), !dbg !474
  call void @llvm.dbg.declare(metadata %struct._okay_datatype* %10, metadata !475, metadata !DIExpression()), !dbg !481
  %30 = bitcast %struct._okay_datatype* %10 to i8*, !dbg !482
  call void @llvm.var.annotation(i8* %30, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.6, i32 0, i32 0), i32 148), !dbg !482
  call void @my_tag_write(%struct._tag* %6, i32 1, i32 1, i32 2), !dbg !483
  call void @llvm.dbg.declare(metadata i8** %11, metadata !484, metadata !DIExpression()), !dbg !485
  %31 = call i8* @zmq_ctx_new(), !dbg !486
  store i8* %31, i8** %11, align 8, !dbg !485
  %32 = load i8*, i8** %11, align 8, !dbg !487
  %33 = call i8* @my_xdc_pub_socket(i8* %32), !dbg !488
  store i8* %33, i8** %3, align 8, !dbg !489
  %34 = load i8*, i8** %11, align 8, !dbg !490
  %35 = bitcast { i64, i32 }* %12 to i8*, !dbg !491
  %36 = bitcast %struct._tag* %6 to i8*, !dbg !491
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %35, i8* align 1 %36, i64 12, i1 false), !dbg !491
  %37 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %12, i32 0, i32 0, !dbg !491
  %38 = load i64, i64* %37, align 1, !dbg !491
  %39 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %12, i32 0, i32 1, !dbg !491
  %40 = load i32, i32* %39, align 1, !dbg !491
  %41 = call i8* @my_xdc_sub_socket(i64 %38, i32 %40, i8* %34), !dbg !491
  store i8* %41, i8** %4, align 8, !dbg !492
  %42 = call i32 @sleep(i32 1), !dbg !493
  %43 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !494
  %44 = getelementptr inbounds %struct._tag, %struct._tag* %43, i32 0, i32 0, !dbg !495
  %45 = load i32, i32* %44, align 1, !dbg !495
  %46 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %9, i32 0, i32 0, !dbg !496
  store i32 %45, i32* %46, align 1, !dbg !497
  %47 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !498
  %48 = getelementptr inbounds %struct._tag, %struct._tag* %47, i32 0, i32 1, !dbg !499
  %49 = load i32, i32* %48, align 1, !dbg !499
  %50 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %9, i32 0, i32 1, !dbg !500
  store i32 %49, i32* %50, align 1, !dbg !501
  %51 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !502
  %52 = getelementptr inbounds %struct._tag, %struct._tag* %51, i32 0, i32 2, !dbg !503
  %53 = load i32, i32* %52, align 1, !dbg !503
  %54 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %9, i32 0, i32 2, !dbg !504
  store i32 %53, i32* %54, align 1, !dbg !505
  %55 = load i8*, i8** %3, align 8, !dbg !506
  %56 = bitcast %struct._nextrpc_datatype* %9 to i8*, !dbg !507
  %57 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %7, i64 0, i64 0, !dbg !508
  call void @my_xdc_asyn_send(i8* %55, i8* %56, %struct._tag* %5, %struct._codec_map* %57), !dbg !509
  %58 = load i8*, i8** %4, align 8, !dbg !510
  %59 = bitcast %struct._okay_datatype* %10 to i8*, !dbg !511
  %60 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %7, i64 0, i64 0, !dbg !512
  call void @my_xdc_blocking_recv(i8* %58, i8* %59, %struct._tag* %6, %struct._codec_map* %60), !dbg !513
  %61 = load i8*, i8** %3, align 8, !dbg !514
  %62 = call i32 @zmq_close(i8* %61), !dbg !515
  %63 = load i8*, i8** %4, align 8, !dbg !516
  %64 = call i32 @zmq_close(i8* %63), !dbg !517
  %65 = load i8*, i8** %11, align 8, !dbg !518
  %66 = call i32 @zmq_ctx_shutdown(i8* %65), !dbg !519
  ret void, !dbg !520
}

declare dso_local void @nextrpc_data_encode(i8*, i8*, i64*) #4

declare dso_local void @nextrpc_data_decode(i8*, i8*, i64*) #4

declare dso_local void @okay_data_encode(i8*, i8*, i64*) #4

declare dso_local void @okay_data_decode(i8*, i8*, i64*) #4

declare dso_local void @request_get_a_data_encode(i8*, i8*, i64*) #4

declare dso_local void @request_get_a_data_decode(i8*, i8*, i64*) #4

declare dso_local void @response_get_a_data_encode(i8*, i8*, i64*) #4

declare dso_local void @response_get_a_data_decode(i8*, i8*, i64*) #4

; Function Attrs: nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #6

declare dso_local i8* @zmq_ctx_new() #4

declare dso_local i32 @sleep(i32) #4

declare dso_local i32 @zmq_close(i8*) #4

declare dso_local i32 @zmq_ctx_shutdown(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @_rpc_get_a() #0 !dbg !521 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca %struct._tag, align 1
  %4 = alloca %struct._tag, align 1
  %5 = alloca [200 x %struct._codec_map], align 16
  %6 = alloca i32, align 4
  %7 = alloca %struct._request_get_a_datatype, align 1
  %8 = alloca %struct._response_get_a_datatype, align 1
  %9 = alloca i8*, align 8
  %10 = alloca { i64, i32 }, align 1
  call void @llvm.dbg.declare(metadata i8** %1, metadata !525, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.declare(metadata i8** %2, metadata !527, metadata !DIExpression()), !dbg !528
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !529, metadata !DIExpression()), !dbg !530
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !531, metadata !DIExpression()), !dbg !532
  call void @llvm.dbg.declare(metadata [200 x %struct._codec_map]* %5, metadata !533, metadata !DIExpression()), !dbg !534
  call void @llvm.dbg.declare(metadata i32* %6, metadata !535, metadata !DIExpression()), !dbg !537
  store i32 0, i32* %6, align 4, !dbg !537
  br label %11, !dbg !538

11:                                               ; preds = %19, %0
  %12 = load i32, i32* %6, align 4, !dbg !539
  %13 = icmp slt i32 %12, 200, !dbg !541
  br i1 %13, label %14, label %22, !dbg !542

14:                                               ; preds = %11
  %15 = load i32, i32* %6, align 4, !dbg !543
  %16 = sext i32 %15 to i64, !dbg !544
  %17 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %5, i64 0, i64 %16, !dbg !544
  %18 = getelementptr inbounds %struct._codec_map, %struct._codec_map* %17, i32 0, i32 0, !dbg !545
  store i32 0, i32* %18, align 4, !dbg !546
  br label %19, !dbg !544

19:                                               ; preds = %14
  %20 = load i32, i32* %6, align 4, !dbg !547
  %21 = add nsw i32 %20, 1, !dbg !547
  store i32 %21, i32* %6, align 4, !dbg !547
  br label %11, !dbg !548, !llvm.loop !549

22:                                               ; preds = %11
  %23 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %5, i64 0, i64 0, !dbg !551
  call void @my_xdc_register(void (i8*, i8*, i64*)* @nextrpc_data_encode, void (i8*, i8*, i64*)* @nextrpc_data_decode, i32 1, %struct._codec_map* %23), !dbg !552
  %24 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %5, i64 0, i64 0, !dbg !553
  call void @my_xdc_register(void (i8*, i8*, i64*)* @okay_data_encode, void (i8*, i8*, i64*)* @okay_data_decode, i32 2, %struct._codec_map* %24), !dbg !554
  %25 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %5, i64 0, i64 0, !dbg !555
  call void @my_xdc_register(void (i8*, i8*, i64*)* @request_get_a_data_encode, void (i8*, i8*, i64*)* @request_get_a_data_decode, i32 3, %struct._codec_map* %25), !dbg !556
  %26 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %5, i64 0, i64 0, !dbg !557
  call void @my_xdc_register(void (i8*, i8*, i64*)* @response_get_a_data_encode, void (i8*, i8*, i64*)* @response_get_a_data_decode, i32 4, %struct._codec_map* %26), !dbg !558
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %7, metadata !559, metadata !DIExpression()), !dbg !565
  %27 = bitcast %struct._request_get_a_datatype* %7 to i8*, !dbg !566
  call void @llvm.var.annotation(i8* %27, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.6, i32 0, i32 0), i32 206), !dbg !566
  call void @my_tag_write(%struct._tag* %3, i32 2, i32 2, i32 3), !dbg !567
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %8, metadata !568, metadata !DIExpression()), !dbg !574
  %28 = bitcast %struct._response_get_a_datatype* %8 to i8*, !dbg !575
  call void @llvm.var.annotation(i8* %28, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.6, i32 0, i32 0), i32 216), !dbg !575
  call void @my_tag_write(%struct._tag* %4, i32 1, i32 1, i32 4), !dbg !576
  %29 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %7, i32 0, i32 0, !dbg !577
  store i32 0, i32* %29, align 1, !dbg !578
  call void @llvm.dbg.declare(metadata i8** %9, metadata !579, metadata !DIExpression()), !dbg !580
  %30 = call i8* @zmq_ctx_new(), !dbg !581
  store i8* %30, i8** %9, align 8, !dbg !580
  %31 = load i8*, i8** %9, align 8, !dbg !582
  %32 = call i8* @my_xdc_pub_socket(i8* %31), !dbg !583
  store i8* %32, i8** %1, align 8, !dbg !584
  %33 = load i8*, i8** %9, align 8, !dbg !585
  %34 = bitcast { i64, i32 }* %10 to i8*, !dbg !586
  %35 = bitcast %struct._tag* %4 to i8*, !dbg !586
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %34, i8* align 1 %35, i64 12, i1 false), !dbg !586
  %36 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %10, i32 0, i32 0, !dbg !586
  %37 = load i64, i64* %36, align 1, !dbg !586
  %38 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %10, i32 0, i32 1, !dbg !586
  %39 = load i32, i32* %38, align 1, !dbg !586
  %40 = call i8* @my_xdc_sub_socket(i64 %37, i32 %39, i8* %33), !dbg !586
  store i8* %40, i8** %2, align 8, !dbg !587
  %41 = call i32 @sleep(i32 1), !dbg !588
  %42 = load i8*, i8** %1, align 8, !dbg !589
  %43 = bitcast %struct._request_get_a_datatype* %7 to i8*, !dbg !590
  %44 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %5, i64 0, i64 0, !dbg !591
  call void @my_xdc_asyn_send(i8* %42, i8* %43, %struct._tag* %3, %struct._codec_map* %44), !dbg !592
  %45 = load i8*, i8** %2, align 8, !dbg !593
  %46 = bitcast %struct._response_get_a_datatype* %8 to i8*, !dbg !594
  %47 = getelementptr inbounds [200 x %struct._codec_map], [200 x %struct._codec_map]* %5, i64 0, i64 0, !dbg !595
  call void @my_xdc_blocking_recv(i8* %45, i8* %46, %struct._tag* %4, %struct._codec_map* %47), !dbg !596
  %48 = load i8*, i8** %1, align 8, !dbg !597
  %49 = call i32 @zmq_close(i8* %48), !dbg !598
  %50 = load i8*, i8** %2, align 8, !dbg !599
  %51 = call i32 @zmq_close(i8* %50), !dbg !600
  %52 = load i8*, i8** %9, align 8, !dbg !601
  %53 = call i32 @zmq_ctx_shutdown(i8* %52), !dbg !602
  %54 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %8, i32 0, i32 0, !dbg !603
  %55 = load double, double* %54, align 1, !dbg !603
  ret double %55, !dbg !604
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_master_rpc_init() #0 !dbg !605 {
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0)), !dbg !608
  ret void, !dbg !609
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind willreturn }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "partitioned/multithreaded/purple/purple_rpc.c", directory: "/workspaces/build/apps/examples/example1")
!2 = !{}
!3 = !{!4, !9, !10}
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !5, line: 26, baseType: !6)
!5 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !7, line: 42, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!16 = distinct !DISubprogram(name: "my_type_check", scope: !17, file: !17, line: 7, type: !18, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./partitioned/multithreaded/purple/purple_rpc.c", directory: "/workspaces/build/apps/examples/example1")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4, !20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "codec_map", file: !22, line: 43, baseType: !23)
!22 = !DIFile(filename: "./partitioned/multithreaded/purple/purple_rpc.h", directory: "/workspaces/build/apps/examples/example1")
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_codec_map", file: !22, line: 39, size: 160, elements: !24)
!24 = !{!25, !27, !36}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "valid", scope: !23, file: !22, line: 40, baseType: !26, size: 32)
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "encode", scope: !23, file: !22, line: 41, baseType: !28, size: 64, offset: 32)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "codec_func_ptr", file: !22, line: 38, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !9, !9, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "/usr/local/lib/clang/10.0.1/include/stddef.h", directory: "")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "decode", scope: !23, file: !22, line: 42, baseType: !28, size: 64, offset: 96)
!37 = !DILocalVariable(name: "typ", arg: 1, scope: !16, file: !17, line: 7, type: !4)
!38 = !DILocation(line: 7, column: 29, scope: !16)
!39 = !DILocalVariable(name: "cmap", arg: 2, scope: !16, file: !17, line: 7, type: !20)
!40 = !DILocation(line: 7, column: 45, scope: !16)
!41 = !DILocation(line: 8, column: 11, scope: !42)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 8, column: 10)
!43 = !DILocation(line: 8, column: 15, scope: !42)
!44 = !DILocation(line: 8, column: 35, scope: !42)
!45 = !DILocation(line: 8, column: 39, scope: !42)
!46 = !DILocation(line: 8, column: 44, scope: !42)
!47 = !DILocation(line: 8, column: 49, scope: !42)
!48 = !DILocation(line: 8, column: 54, scope: !42)
!49 = !DILocation(line: 8, column: 10, scope: !16)
!50 = !DILocation(line: 9, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !42, file: !17, line: 8, column: 61)
!52 = !DILocation(line: 11, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "my_xdc_register", scope: !17, file: !17, line: 13, type: !54, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !28, !28, !26, !20}
!56 = !DILocalVariable(name: "encode", arg: 1, scope: !53, file: !17, line: 13, type: !28)
!57 = !DILocation(line: 13, column: 37, scope: !53)
!58 = !DILocalVariable(name: "decode", arg: 2, scope: !53, file: !17, line: 13, type: !28)
!59 = !DILocation(line: 13, column: 60, scope: !53)
!60 = !DILocalVariable(name: "typ", arg: 3, scope: !53, file: !17, line: 13, type: !26)
!61 = !DILocation(line: 13, column: 72, scope: !53)
!62 = !DILocalVariable(name: "cmap", arg: 4, scope: !53, file: !17, line: 13, type: !20)
!63 = !DILocation(line: 13, column: 88, scope: !53)
!64 = !DILocation(line: 14, column: 5, scope: !53)
!65 = !DILocation(line: 14, column: 10, scope: !53)
!66 = !DILocation(line: 14, column: 15, scope: !53)
!67 = !DILocation(line: 14, column: 20, scope: !53)
!68 = !DILocation(line: 15, column: 22, scope: !53)
!69 = !DILocation(line: 15, column: 5, scope: !53)
!70 = !DILocation(line: 15, column: 10, scope: !53)
!71 = !DILocation(line: 15, column: 15, scope: !53)
!72 = !DILocation(line: 15, column: 21, scope: !53)
!73 = !DILocation(line: 16, column: 22, scope: !53)
!74 = !DILocation(line: 16, column: 5, scope: !53)
!75 = !DILocation(line: 16, column: 10, scope: !53)
!76 = !DILocation(line: 16, column: 15, scope: !53)
!77 = !DILocation(line: 16, column: 21, scope: !53)
!78 = !DILocation(line: 17, column: 1, scope: !53)
!79 = distinct !DISubprogram(name: "my_tag_encode", scope: !17, file: !17, line: 20, type: !80, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{null, !82, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "gaps_tag", file: !22, line: 29, baseType: !84)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_tag", file: !22, line: 25, size: 96, elements: !85)
!85 = !{!86, !87, !88}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "mux", scope: !84, file: !22, line: 26, baseType: !4, size: 32)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sec", scope: !84, file: !22, line: 27, baseType: !4, size: 32, offset: 32)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "typ", scope: !84, file: !22, line: 28, baseType: !4, size: 32, offset: 64)
!89 = !DILocalVariable(name: "tag_out", arg: 1, scope: !79, file: !17, line: 20, type: !82)
!90 = !DILocation(line: 20, column: 31, scope: !79)
!91 = !DILocalVariable(name: "tag_in", arg: 2, scope: !79, file: !17, line: 20, type: !82)
!92 = !DILocation(line: 20, column: 50, scope: !79)
!93 = !DILocation(line: 21, column: 26, scope: !79)
!94 = !DILocation(line: 21, column: 34, scope: !79)
!95 = !DILocation(line: 21, column: 20, scope: !79)
!96 = !DILocation(line: 21, column: 5, scope: !79)
!97 = !DILocation(line: 21, column: 14, scope: !79)
!98 = !DILocation(line: 21, column: 18, scope: !79)
!99 = !DILocation(line: 22, column: 26, scope: !79)
!100 = !DILocation(line: 22, column: 34, scope: !79)
!101 = !DILocation(line: 22, column: 20, scope: !79)
!102 = !DILocation(line: 22, column: 5, scope: !79)
!103 = !DILocation(line: 22, column: 14, scope: !79)
!104 = !DILocation(line: 22, column: 18, scope: !79)
!105 = !DILocation(line: 23, column: 26, scope: !79)
!106 = !DILocation(line: 23, column: 34, scope: !79)
!107 = !DILocation(line: 23, column: 20, scope: !79)
!108 = !DILocation(line: 23, column: 5, scope: !79)
!109 = !DILocation(line: 23, column: 14, scope: !79)
!110 = !DILocation(line: 23, column: 18, scope: !79)
!111 = !DILocation(line: 24, column: 1, scope: !79)
!112 = distinct !DISubprogram(name: "my_tag_decode", scope: !17, file: !17, line: 27, type: !80, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "tag_out", arg: 1, scope: !112, file: !17, line: 27, type: !82)
!114 = !DILocation(line: 27, column: 31, scope: !112)
!115 = !DILocalVariable(name: "tag_in", arg: 2, scope: !112, file: !17, line: 27, type: !82)
!116 = !DILocation(line: 27, column: 50, scope: !112)
!117 = !DILocation(line: 28, column: 26, scope: !112)
!118 = !DILocation(line: 28, column: 34, scope: !112)
!119 = !DILocation(line: 28, column: 20, scope: !112)
!120 = !DILocation(line: 28, column: 5, scope: !112)
!121 = !DILocation(line: 28, column: 14, scope: !112)
!122 = !DILocation(line: 28, column: 18, scope: !112)
!123 = !DILocation(line: 29, column: 26, scope: !112)
!124 = !DILocation(line: 29, column: 34, scope: !112)
!125 = !DILocation(line: 29, column: 20, scope: !112)
!126 = !DILocation(line: 29, column: 5, scope: !112)
!127 = !DILocation(line: 29, column: 14, scope: !112)
!128 = !DILocation(line: 29, column: 18, scope: !112)
!129 = !DILocation(line: 30, column: 26, scope: !112)
!130 = !DILocation(line: 30, column: 34, scope: !112)
!131 = !DILocation(line: 30, column: 20, scope: !112)
!132 = !DILocation(line: 30, column: 5, scope: !112)
!133 = !DILocation(line: 30, column: 14, scope: !112)
!134 = !DILocation(line: 30, column: 18, scope: !112)
!135 = !DILocation(line: 31, column: 1, scope: !112)
!136 = distinct !DISubprogram(name: "my_len_encode", scope: !17, file: !17, line: 34, type: !137, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DISubroutineType(types: !138)
!138 = !{null, !139, !33}
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!140 = !DILocalVariable(name: "out", arg: 1, scope: !136, file: !17, line: 34, type: !139)
!141 = !DILocation(line: 34, column: 31, scope: !136)
!142 = !DILocalVariable(name: "len", arg: 2, scope: !136, file: !17, line: 34, type: !33)
!143 = !DILocation(line: 34, column: 43, scope: !136)
!144 = !DILocation(line: 35, column: 29, scope: !136)
!145 = !DILocation(line: 35, column: 18, scope: !136)
!146 = !DILocation(line: 35, column: 12, scope: !136)
!147 = !DILocation(line: 35, column: 6, scope: !136)
!148 = !DILocation(line: 35, column: 10, scope: !136)
!149 = !DILocation(line: 36, column: 1, scope: !136)
!150 = distinct !DISubprogram(name: "my_len_decode", scope: !17, file: !17, line: 39, type: !151, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DISubroutineType(types: !152)
!152 = !{null, !32, !4}
!153 = !DILocalVariable(name: "out", arg: 1, scope: !150, file: !17, line: 39, type: !32)
!154 = !DILocation(line: 39, column: 29, scope: !150)
!155 = !DILocalVariable(name: "in", arg: 2, scope: !150, file: !17, line: 39, type: !4)
!156 = !DILocation(line: 39, column: 43, scope: !150)
!157 = !DILocation(line: 40, column: 29, scope: !150)
!158 = !DILocation(line: 40, column: 23, scope: !150)
!159 = !DILocation(line: 40, column: 12, scope: !150)
!160 = !DILocation(line: 40, column: 6, scope: !150)
!161 = !DILocation(line: 40, column: 10, scope: !150)
!162 = !DILocation(line: 41, column: 1, scope: !150)
!163 = distinct !DISubprogram(name: "my_gaps_data_encode", scope: !17, file: !17, line: 43, type: !164, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!164 = !DISubroutineType(types: !165)
!165 = !{null, !166, !32, !179, !32, !82, !20}
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "sdh_ha_v1", file: !22, line: 36, baseType: !168)
!168 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_sdh_ha_v1", file: !22, line: 32, size: 16128, elements: !169)
!169 = !{!170, !171, !172}
!170 = !DIDerivedType(tag: DW_TAG_member, name: "tag", scope: !168, file: !22, line: 33, baseType: !83, size: 96)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "data_len", scope: !168, file: !22, line: 34, baseType: !4, size: 32, offset: 96)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !168, file: !22, line: 35, baseType: !173, size: 16000, offset: 128)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !174, size: 16000, elements: !177)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !5, line: 24, baseType: !175)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !7, line: 38, baseType: !176)
!176 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!177 = !{!178}
!178 = !DISubrange(count: 2000)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!180 = !DILocalVariable(name: "p", arg: 1, scope: !163, file: !17, line: 43, type: !166)
!181 = !DILocation(line: 43, column: 37, scope: !163)
!182 = !DILocalVariable(name: "p_len", arg: 2, scope: !163, file: !17, line: 43, type: !32)
!183 = !DILocation(line: 43, column: 48, scope: !163)
!184 = !DILocalVariable(name: "buff_in", arg: 3, scope: !163, file: !17, line: 43, type: !179)
!185 = !DILocation(line: 43, column: 64, scope: !163)
!186 = !DILocalVariable(name: "len_out", arg: 4, scope: !163, file: !17, line: 43, type: !32)
!187 = !DILocation(line: 43, column: 81, scope: !163)
!188 = !DILocalVariable(name: "tag", arg: 5, scope: !163, file: !17, line: 43, type: !82)
!189 = !DILocation(line: 43, column: 100, scope: !163)
!190 = !DILocalVariable(name: "cmap", arg: 6, scope: !163, file: !17, line: 43, type: !20)
!191 = !DILocation(line: 43, column: 116, scope: !163)
!192 = !DILocalVariable(name: "typ", scope: !163, file: !17, line: 44, type: !4)
!193 = !DILocation(line: 44, column: 14, scope: !163)
!194 = !DILocation(line: 44, column: 20, scope: !163)
!195 = !DILocation(line: 44, column: 25, scope: !163)
!196 = !DILocation(line: 45, column: 19, scope: !163)
!197 = !DILocation(line: 45, column: 24, scope: !163)
!198 = !DILocation(line: 45, column: 5, scope: !163)
!199 = !DILocation(line: 46, column: 5, scope: !163)
!200 = !DILocation(line: 46, column: 10, scope: !163)
!201 = !DILocation(line: 46, column: 15, scope: !163)
!202 = !DILocation(line: 46, column: 23, scope: !163)
!203 = !DILocation(line: 46, column: 26, scope: !163)
!204 = !DILocation(line: 46, column: 32, scope: !163)
!205 = !DILocation(line: 46, column: 41, scope: !163)
!206 = !DILocation(line: 47, column: 21, scope: !163)
!207 = !DILocation(line: 47, column: 24, scope: !163)
!208 = !DILocation(line: 47, column: 30, scope: !163)
!209 = !DILocation(line: 47, column: 5, scope: !163)
!210 = !DILocation(line: 48, column: 21, scope: !163)
!211 = !DILocation(line: 48, column: 24, scope: !163)
!212 = !DILocation(line: 48, column: 36, scope: !163)
!213 = !DILocation(line: 48, column: 35, scope: !163)
!214 = !DILocation(line: 48, column: 5, scope: !163)
!215 = !DILocation(line: 49, column: 16, scope: !163)
!216 = !DILocation(line: 49, column: 15, scope: !163)
!217 = !DILocation(line: 49, column: 25, scope: !163)
!218 = !DILocation(line: 49, column: 42, scope: !163)
!219 = !DILocation(line: 49, column: 6, scope: !163)
!220 = !DILocation(line: 49, column: 12, scope: !163)
!221 = !DILocation(line: 50, column: 1, scope: !163)
!222 = distinct !DISubprogram(name: "my_gaps_data_decode", scope: !17, file: !17, line: 53, type: !223, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!223 = !DISubroutineType(types: !224)
!224 = !{null, !166, !33, !179, !32, !82, !20}
!225 = !DILocalVariable(name: "p", arg: 1, scope: !222, file: !17, line: 53, type: !166)
!226 = !DILocation(line: 53, column: 37, scope: !222)
!227 = !DILocalVariable(name: "p_len", arg: 2, scope: !222, file: !17, line: 53, type: !33)
!228 = !DILocation(line: 53, column: 47, scope: !222)
!229 = !DILocalVariable(name: "buff_out", arg: 3, scope: !222, file: !17, line: 53, type: !179)
!230 = !DILocation(line: 53, column: 63, scope: !222)
!231 = !DILocalVariable(name: "len_out", arg: 4, scope: !222, file: !17, line: 53, type: !32)
!232 = !DILocation(line: 53, column: 81, scope: !222)
!233 = !DILocalVariable(name: "tag", arg: 5, scope: !222, file: !17, line: 53, type: !82)
!234 = !DILocation(line: 53, column: 100, scope: !222)
!235 = !DILocalVariable(name: "cmap", arg: 6, scope: !222, file: !17, line: 53, type: !20)
!236 = !DILocation(line: 53, column: 116, scope: !222)
!237 = !DILocalVariable(name: "typ", scope: !222, file: !17, line: 54, type: !4)
!238 = !DILocation(line: 54, column: 14, scope: !222)
!239 = !DILocation(line: 54, column: 20, scope: !222)
!240 = !DILocation(line: 54, column: 25, scope: !222)
!241 = !DILocation(line: 55, column: 19, scope: !222)
!242 = !DILocation(line: 55, column: 24, scope: !222)
!243 = !DILocation(line: 55, column: 5, scope: !222)
!244 = !DILocation(line: 56, column: 19, scope: !222)
!245 = !DILocation(line: 56, column: 26, scope: !222)
!246 = !DILocation(line: 56, column: 29, scope: !222)
!247 = !DILocation(line: 56, column: 5, scope: !222)
!248 = !DILocation(line: 57, column: 19, scope: !222)
!249 = !DILocation(line: 57, column: 28, scope: !222)
!250 = !DILocation(line: 57, column: 31, scope: !222)
!251 = !DILocation(line: 57, column: 5, scope: !222)
!252 = !DILocation(line: 58, column: 5, scope: !222)
!253 = !DILocation(line: 58, column: 10, scope: !222)
!254 = !DILocation(line: 58, column: 15, scope: !222)
!255 = !DILocation(line: 58, column: 23, scope: !222)
!256 = !DILocation(line: 58, column: 33, scope: !222)
!257 = !DILocation(line: 58, column: 36, scope: !222)
!258 = !DILocation(line: 59, column: 5, scope: !222)
!259 = distinct !DISubprogram(name: "my_xdc_asyn_send", scope: !17, file: !17, line: 61, type: !260, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!260 = !DISubroutineType(types: !261)
!261 = !{null, !9, !9, !82, !20}
!262 = !DILocalVariable(name: "socket", arg: 1, scope: !259, file: !17, line: 61, type: !9)
!263 = !DILocation(line: 61, column: 29, scope: !259)
!264 = !DILocalVariable(name: "adu", arg: 2, scope: !259, file: !17, line: 61, type: !9)
!265 = !DILocation(line: 61, column: 43, scope: !259)
!266 = !DILocalVariable(name: "tag", arg: 3, scope: !259, file: !17, line: 61, type: !82)
!267 = !DILocation(line: 61, column: 58, scope: !259)
!268 = !DILocalVariable(name: "cmap", arg: 4, scope: !259, file: !17, line: 61, type: !20)
!269 = !DILocation(line: 61, column: 74, scope: !259)
!270 = !DILocalVariable(name: "packet", scope: !259, file: !17, line: 62, type: !167)
!271 = !DILocation(line: 62, column: 18, scope: !259)
!272 = !DILocalVariable(name: "p", scope: !259, file: !17, line: 62, type: !166)
!273 = !DILocation(line: 62, column: 27, scope: !259)
!274 = !DILocalVariable(name: "packet_len", scope: !259, file: !17, line: 63, type: !33)
!275 = !DILocation(line: 63, column: 18, scope: !259)
!276 = !DILocalVariable(name: "adu_len", scope: !259, file: !17, line: 64, type: !33)
!277 = !DILocation(line: 64, column: 12, scope: !259)
!278 = !DILocation(line: 65, column: 25, scope: !259)
!279 = !DILocation(line: 65, column: 41, scope: !259)
!280 = !DILocation(line: 65, column: 56, scope: !259)
!281 = !DILocation(line: 65, column: 61, scope: !259)
!282 = !DILocation(line: 65, column: 5, scope: !259)
!283 = !DILocalVariable(name: "bytes", scope: !259, file: !17, line: 66, type: !26)
!284 = !DILocation(line: 66, column: 9, scope: !259)
!285 = !DILocation(line: 66, column: 27, scope: !259)
!286 = !DILocation(line: 66, column: 44, scope: !259)
!287 = !DILocation(line: 66, column: 35, scope: !259)
!288 = !DILocation(line: 66, column: 47, scope: !259)
!289 = !DILocation(line: 66, column: 17, scope: !259)
!290 = !DILocation(line: 67, column: 9, scope: !291)
!291 = distinct !DILexicalBlock(scope: !259, file: !17, line: 67, column: 9)
!292 = !DILocation(line: 67, column: 15, scope: !291)
!293 = !DILocation(line: 67, column: 9, scope: !259)
!294 = !DILocation(line: 67, column: 29, scope: !291)
!295 = !DILocation(line: 67, column: 71, scope: !291)
!296 = !DILocation(line: 67, column: 58, scope: !291)
!297 = !DILocation(line: 67, column: 79, scope: !291)
!298 = !DILocation(line: 67, column: 21, scope: !291)
!299 = !DILocation(line: 68, column: 1, scope: !259)
!300 = distinct !DISubprogram(name: "my_xdc_blocking_recv", scope: !17, file: !17, line: 70, type: !260, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!301 = !DILocalVariable(name: "socket", arg: 1, scope: !300, file: !17, line: 70, type: !9)
!302 = !DILocation(line: 70, column: 33, scope: !300)
!303 = !DILocalVariable(name: "adu", arg: 2, scope: !300, file: !17, line: 70, type: !9)
!304 = !DILocation(line: 70, column: 47, scope: !300)
!305 = !DILocalVariable(name: "tag", arg: 3, scope: !300, file: !17, line: 70, type: !82)
!306 = !DILocation(line: 70, column: 62, scope: !300)
!307 = !DILocalVariable(name: "cmap", arg: 4, scope: !300, file: !17, line: 70, type: !20)
!308 = !DILocation(line: 70, column: 78, scope: !300)
!309 = !DILocalVariable(name: "packet", scope: !300, file: !17, line: 71, type: !167)
!310 = !DILocation(line: 71, column: 15, scope: !300)
!311 = !DILocalVariable(name: "p", scope: !300, file: !17, line: 72, type: !9)
!312 = !DILocation(line: 72, column: 11, scope: !300)
!313 = !DILocation(line: 72, column: 15, scope: !300)
!314 = !DILocalVariable(name: "size", scope: !300, file: !17, line: 73, type: !26)
!315 = !DILocation(line: 73, column: 9, scope: !300)
!316 = !DILocation(line: 73, column: 25, scope: !300)
!317 = !DILocation(line: 73, column: 33, scope: !300)
!318 = !DILocation(line: 73, column: 16, scope: !300)
!319 = !DILocalVariable(name: "adu_len", scope: !300, file: !17, line: 74, type: !33)
!320 = !DILocation(line: 74, column: 12, scope: !300)
!321 = !DILocation(line: 75, column: 25, scope: !300)
!322 = !DILocation(line: 75, column: 28, scope: !300)
!323 = !DILocation(line: 75, column: 34, scope: !300)
!324 = !DILocation(line: 75, column: 49, scope: !300)
!325 = !DILocation(line: 75, column: 54, scope: !300)
!326 = !DILocation(line: 75, column: 5, scope: !300)
!327 = !DILocation(line: 76, column: 1, scope: !300)
!328 = distinct !DISubprogram(name: "my_xdc_pub_socket", scope: !17, file: !17, line: 78, type: !329, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!329 = !DISubroutineType(types: !330)
!330 = !{!9, !9}
!331 = !DILocalVariable(name: "ctx", arg: 1, scope: !328, file: !17, line: 78, type: !9)
!332 = !DILocation(line: 78, column: 31, scope: !328)
!333 = !DILocalVariable(name: "err", scope: !328, file: !17, line: 79, type: !26)
!334 = !DILocation(line: 79, column: 9, scope: !328)
!335 = !DILocalVariable(name: "socket", scope: !328, file: !17, line: 80, type: !9)
!336 = !DILocation(line: 80, column: 11, scope: !328)
!337 = !DILocation(line: 81, column: 25, scope: !328)
!338 = !DILocation(line: 81, column: 14, scope: !328)
!339 = !DILocation(line: 81, column: 12, scope: !328)
!340 = !DILocation(line: 82, column: 23, scope: !328)
!341 = !DILocation(line: 82, column: 11, scope: !328)
!342 = !DILocation(line: 82, column: 9, scope: !328)
!343 = !DILocation(line: 83, column: 12, scope: !328)
!344 = !DILocation(line: 83, column: 5, scope: !328)
!345 = distinct !DISubprogram(name: "my_xdc_sub_socket", scope: !17, file: !17, line: 86, type: !346, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!346 = !DISubroutineType(types: !347)
!347 = !{!9, !83, !9}
!348 = !DILocalVariable(name: "tag", arg: 1, scope: !345, file: !17, line: 86, type: !83)
!349 = !DILocation(line: 86, column: 34, scope: !345)
!350 = !DILocalVariable(name: "ctx", arg: 2, scope: !345, file: !17, line: 86, type: !9)
!351 = !DILocation(line: 86, column: 45, scope: !345)
!352 = !DILocalVariable(name: "err", scope: !345, file: !17, line: 87, type: !26)
!353 = !DILocation(line: 87, column: 9, scope: !345)
!354 = !DILocalVariable(name: "tag4filter", scope: !345, file: !17, line: 88, type: !83)
!355 = !DILocation(line: 88, column: 14, scope: !345)
!356 = !DILocalVariable(name: "socket", scope: !345, file: !17, line: 89, type: !9)
!357 = !DILocation(line: 89, column: 11, scope: !345)
!358 = !DILocation(line: 90, column: 25, scope: !345)
!359 = !DILocation(line: 90, column: 14, scope: !345)
!360 = !DILocation(line: 90, column: 12, scope: !345)
!361 = !DILocation(line: 91, column: 23, scope: !345)
!362 = !DILocation(line: 91, column: 11, scope: !345)
!363 = !DILocation(line: 91, column: 9, scope: !345)
!364 = !DILocation(line: 92, column: 5, scope: !345)
!365 = !DILocation(line: 93, column: 26, scope: !345)
!366 = !DILocation(line: 93, column: 49, scope: !345)
!367 = !DILocation(line: 93, column: 11, scope: !345)
!368 = !DILocation(line: 93, column: 9, scope: !345)
!369 = !DILocation(line: 94, column: 5, scope: !370)
!370 = distinct !DILexicalBlock(scope: !371, file: !17, line: 94, column: 5)
!371 = distinct !DILexicalBlock(scope: !345, file: !17, line: 94, column: 5)
!372 = !DILocation(line: 94, column: 5, scope: !371)
!373 = !DILocation(line: 95, column: 12, scope: !345)
!374 = !DILocation(line: 95, column: 5, scope: !345)
!375 = distinct !DISubprogram(name: "my_tag_write", scope: !17, file: !17, line: 98, type: !376, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!376 = !DISubroutineType(types: !377)
!377 = !{null, !82, !4, !4, !4}
!378 = !DILocalVariable(name: "tag", arg: 1, scope: !375, file: !17, line: 98, type: !82)
!379 = !DILocation(line: 98, column: 30, scope: !375)
!380 = !DILocalVariable(name: "mux", arg: 2, scope: !375, file: !17, line: 98, type: !4)
!381 = !DILocation(line: 98, column: 44, scope: !375)
!382 = !DILocalVariable(name: "sec", arg: 3, scope: !375, file: !17, line: 98, type: !4)
!383 = !DILocation(line: 98, column: 58, scope: !375)
!384 = !DILocalVariable(name: "typ", arg: 4, scope: !375, file: !17, line: 98, type: !4)
!385 = !DILocation(line: 98, column: 72, scope: !375)
!386 = !DILocation(line: 99, column: 16, scope: !375)
!387 = !DILocation(line: 99, column: 5, scope: !375)
!388 = !DILocation(line: 99, column: 10, scope: !375)
!389 = !DILocation(line: 99, column: 14, scope: !375)
!390 = !DILocation(line: 100, column: 16, scope: !375)
!391 = !DILocation(line: 100, column: 5, scope: !375)
!392 = !DILocation(line: 100, column: 10, scope: !375)
!393 = !DILocation(line: 100, column: 14, scope: !375)
!394 = !DILocation(line: 101, column: 16, scope: !375)
!395 = !DILocation(line: 101, column: 5, scope: !375)
!396 = !DILocation(line: 101, column: 10, scope: !375)
!397 = !DILocation(line: 101, column: 14, scope: !375)
!398 = !DILocation(line: 102, column: 1, scope: !375)
!399 = distinct !DISubprogram(name: "_hal_init", scope: !17, file: !17, line: 106, type: !400, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!400 = !DISubroutineType(types: !401)
!401 = !{null, !10, !10}
!402 = !DILocalVariable(name: "inuri", arg: 1, scope: !399, file: !17, line: 106, type: !10)
!403 = !DILocation(line: 106, column: 22, scope: !399)
!404 = !DILocalVariable(name: "outuri", arg: 2, scope: !399, file: !17, line: 106, type: !10)
!405 = !DILocation(line: 106, column: 35, scope: !399)
!406 = !DILocation(line: 115, column: 1, scope: !399)
!407 = distinct !DISubprogram(name: "_notify_next_tag", scope: !17, file: !17, line: 117, type: !408, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!408 = !DISubroutineType(types: !409)
!409 = !{null, !82}
!410 = !DILocalVariable(name: "n_tag", arg: 1, scope: !407, file: !17, line: 117, type: !82)
!411 = !DILocation(line: 117, column: 33, scope: !407)
!412 = !DILocalVariable(name: "psocket", scope: !407, file: !17, line: 119, type: !9)
!413 = !DILocation(line: 119, column: 11, scope: !407)
!414 = !DILocalVariable(name: "ssocket", scope: !407, file: !17, line: 120, type: !9)
!415 = !DILocation(line: 120, column: 11, scope: !407)
!416 = !DILocalVariable(name: "t_tag", scope: !407, file: !17, line: 121, type: !83)
!417 = !DILocation(line: 121, column: 14, scope: !407)
!418 = !DILocalVariable(name: "o_tag", scope: !407, file: !17, line: 122, type: !83)
!419 = !DILocation(line: 122, column: 14, scope: !407)
!420 = !DILocalVariable(name: "mycmap", scope: !407, file: !17, line: 123, type: !421)
!421 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 32000, elements: !422)
!422 = !{!423}
!423 = !DISubrange(count: 200)
!424 = !DILocation(line: 123, column: 16, scope: !407)
!425 = !DILocalVariable(name: "i", scope: !426, file: !17, line: 124, type: !26)
!426 = distinct !DILexicalBlock(scope: !407, file: !17, line: 124, column: 5)
!427 = !DILocation(line: 124, column: 14, scope: !426)
!428 = !DILocation(line: 124, column: 10, scope: !426)
!429 = !DILocation(line: 124, column: 19, scope: !430)
!430 = distinct !DILexicalBlock(scope: !426, file: !17, line: 124, column: 5)
!431 = !DILocation(line: 124, column: 21, scope: !430)
!432 = !DILocation(line: 124, column: 5, scope: !426)
!433 = !DILocation(line: 124, column: 53, scope: !430)
!434 = !DILocation(line: 124, column: 46, scope: !430)
!435 = !DILocation(line: 124, column: 56, scope: !430)
!436 = !DILocation(line: 124, column: 61, scope: !430)
!437 = !DILocation(line: 124, column: 41, scope: !430)
!438 = !DILocation(line: 124, column: 5, scope: !430)
!439 = distinct !{!439, !432, !440}
!440 = !DILocation(line: 124, column: 62, scope: !426)
!441 = !DILocation(line: 125, column: 81, scope: !407)
!442 = !DILocation(line: 125, column: 5, scope: !407)
!443 = !DILocation(line: 126, column: 72, scope: !407)
!444 = !DILocation(line: 126, column: 5, scope: !407)
!445 = !DILocation(line: 127, column: 99, scope: !407)
!446 = !DILocation(line: 127, column: 5, scope: !407)
!447 = !DILocation(line: 128, column: 102, scope: !407)
!448 = !DILocation(line: 128, column: 5, scope: !407)
!449 = !DILocalVariable(name: "nxt", scope: !407, file: !17, line: 138, type: !450)
!450 = !DIDerivedType(tag: DW_TAG_typedef, name: "nextrpc_datatype", file: !451, line: 39, baseType: !452)
!451 = !DIFile(filename: "./partitioned/multithreaded/autogen/codec.h", directory: "/workspaces/build/apps/examples/example1")
!452 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_nextrpc_datatype", file: !451, line: 34, size: 224, elements: !453)
!453 = !{!454, !458, !459, !460}
!454 = !DIDerivedType(tag: DW_TAG_member, name: "mux", scope: !452, file: !451, line: 35, baseType: !455, size: 32)
!455 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !456, line: 26, baseType: !457)
!456 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!457 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !7, line: 41, baseType: !26)
!458 = !DIDerivedType(tag: DW_TAG_member, name: "sec", scope: !452, file: !451, line: 36, baseType: !455, size: 32, offset: 32)
!459 = !DIDerivedType(tag: DW_TAG_member, name: "typ", scope: !452, file: !451, line: 37, baseType: !455, size: 32, offset: 64)
!460 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !452, file: !451, line: 38, baseType: !461, size: 128, offset: 96)
!461 = !DIDerivedType(tag: DW_TAG_typedef, name: "trailer_datatype", file: !451, line: 24, baseType: !462)
!462 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_trailer_datatype", file: !451, line: 18, size: 128, elements: !463)
!463 = !{!464, !465, !466, !467, !471}
!464 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !462, file: !451, line: 19, baseType: !4, size: 32)
!465 = !DIDerivedType(tag: DW_TAG_member, name: "rqr", scope: !462, file: !451, line: 20, baseType: !4, size: 32, offset: 32)
!466 = !DIDerivedType(tag: DW_TAG_member, name: "oid", scope: !462, file: !451, line: 21, baseType: !4, size: 32, offset: 64)
!467 = !DIDerivedType(tag: DW_TAG_member, name: "mid", scope: !462, file: !451, line: 22, baseType: !468, size: 16, offset: 96)
!468 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !5, line: 25, baseType: !469)
!469 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !7, line: 40, baseType: !470)
!470 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!471 = !DIDerivedType(tag: DW_TAG_member, name: "crc", scope: !462, file: !451, line: 23, baseType: !468, size: 16, offset: 112)
!472 = !DILocation(line: 138, column: 22, scope: !407)
!473 = !DILocation(line: 138, column: 5, scope: !407)
!474 = !DILocation(line: 142, column: 5, scope: !407)
!475 = !DILocalVariable(name: "okay", scope: !407, file: !17, line: 148, type: !476)
!476 = !DIDerivedType(tag: DW_TAG_typedef, name: "okay_datatype", file: !451, line: 51, baseType: !477)
!477 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_okay_datatype", file: !451, line: 48, size: 160, elements: !478)
!478 = !{!479, !480}
!479 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !477, file: !451, line: 49, baseType: !455, size: 32)
!480 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !477, file: !451, line: 50, baseType: !461, size: 128, offset: 32)
!481 = !DILocation(line: 148, column: 19, scope: !407)
!482 = !DILocation(line: 148, column: 5, scope: !407)
!483 = !DILocation(line: 152, column: 5, scope: !407)
!484 = !DILocalVariable(name: "ctx", scope: !407, file: !17, line: 157, type: !9)
!485 = !DILocation(line: 157, column: 12, scope: !407)
!486 = !DILocation(line: 157, column: 18, scope: !407)
!487 = !DILocation(line: 158, column: 33, scope: !407)
!488 = !DILocation(line: 158, column: 15, scope: !407)
!489 = !DILocation(line: 158, column: 13, scope: !407)
!490 = !DILocation(line: 159, column: 40, scope: !407)
!491 = !DILocation(line: 159, column: 15, scope: !407)
!492 = !DILocation(line: 159, column: 13, scope: !407)
!493 = !DILocation(line: 160, column: 5, scope: !407)
!494 = !DILocation(line: 169, column: 15, scope: !407)
!495 = !DILocation(line: 169, column: 22, scope: !407)
!496 = !DILocation(line: 169, column: 9, scope: !407)
!497 = !DILocation(line: 169, column: 13, scope: !407)
!498 = !DILocation(line: 170, column: 15, scope: !407)
!499 = !DILocation(line: 170, column: 22, scope: !407)
!500 = !DILocation(line: 170, column: 9, scope: !407)
!501 = !DILocation(line: 170, column: 13, scope: !407)
!502 = !DILocation(line: 171, column: 15, scope: !407)
!503 = !DILocation(line: 171, column: 22, scope: !407)
!504 = !DILocation(line: 171, column: 9, scope: !407)
!505 = !DILocation(line: 171, column: 13, scope: !407)
!506 = !DILocation(line: 173, column: 22, scope: !407)
!507 = !DILocation(line: 173, column: 31, scope: !407)
!508 = !DILocation(line: 173, column: 45, scope: !407)
!509 = !DILocation(line: 173, column: 5, scope: !407)
!510 = !DILocation(line: 174, column: 26, scope: !407)
!511 = !DILocation(line: 174, column: 35, scope: !407)
!512 = !DILocation(line: 174, column: 50, scope: !407)
!513 = !DILocation(line: 174, column: 5, scope: !407)
!514 = !DILocation(line: 175, column: 15, scope: !407)
!515 = !DILocation(line: 175, column: 5, scope: !407)
!516 = !DILocation(line: 176, column: 15, scope: !407)
!517 = !DILocation(line: 176, column: 5, scope: !407)
!518 = !DILocation(line: 177, column: 22, scope: !407)
!519 = !DILocation(line: 177, column: 5, scope: !407)
!520 = !DILocation(line: 183, column: 1, scope: !407)
!521 = distinct !DISubprogram(name: "_rpc_get_a", scope: !17, file: !17, line: 185, type: !522, scopeLine: 185, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!522 = !DISubroutineType(types: !523)
!523 = !{!524}
!524 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!525 = !DILocalVariable(name: "psocket", scope: !521, file: !17, line: 187, type: !9)
!526 = !DILocation(line: 187, column: 11, scope: !521)
!527 = !DILocalVariable(name: "ssocket", scope: !521, file: !17, line: 188, type: !9)
!528 = !DILocation(line: 188, column: 11, scope: !521)
!529 = !DILocalVariable(name: "t_tag", scope: !521, file: !17, line: 189, type: !83)
!530 = !DILocation(line: 189, column: 14, scope: !521)
!531 = !DILocalVariable(name: "o_tag", scope: !521, file: !17, line: 190, type: !83)
!532 = !DILocation(line: 190, column: 14, scope: !521)
!533 = !DILocalVariable(name: "mycmap", scope: !521, file: !17, line: 191, type: !421)
!534 = !DILocation(line: 191, column: 16, scope: !521)
!535 = !DILocalVariable(name: "i", scope: !536, file: !17, line: 192, type: !26)
!536 = distinct !DILexicalBlock(scope: !521, file: !17, line: 192, column: 5)
!537 = !DILocation(line: 192, column: 14, scope: !536)
!538 = !DILocation(line: 192, column: 10, scope: !536)
!539 = !DILocation(line: 192, column: 19, scope: !540)
!540 = distinct !DILexicalBlock(scope: !536, file: !17, line: 192, column: 5)
!541 = !DILocation(line: 192, column: 21, scope: !540)
!542 = !DILocation(line: 192, column: 5, scope: !536)
!543 = !DILocation(line: 192, column: 53, scope: !540)
!544 = !DILocation(line: 192, column: 46, scope: !540)
!545 = !DILocation(line: 192, column: 56, scope: !540)
!546 = !DILocation(line: 192, column: 61, scope: !540)
!547 = !DILocation(line: 192, column: 41, scope: !540)
!548 = !DILocation(line: 192, column: 5, scope: !540)
!549 = distinct !{!549, !542, !550}
!550 = !DILocation(line: 192, column: 62, scope: !536)
!551 = !DILocation(line: 193, column: 81, scope: !521)
!552 = !DILocation(line: 193, column: 5, scope: !521)
!553 = !DILocation(line: 194, column: 72, scope: !521)
!554 = !DILocation(line: 194, column: 5, scope: !521)
!555 = !DILocation(line: 195, column: 99, scope: !521)
!556 = !DILocation(line: 195, column: 5, scope: !521)
!557 = !DILocation(line: 196, column: 102, scope: !521)
!558 = !DILocation(line: 196, column: 5, scope: !521)
!559 = !DILocalVariable(name: "req_get_a", scope: !521, file: !17, line: 206, type: !560)
!560 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_a_datatype", file: !451, line: 61, baseType: !561)
!561 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_a_datatype", file: !451, line: 58, size: 160, elements: !562)
!562 = !{!563, !564}
!563 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !561, file: !451, line: 59, baseType: !455, size: 32)
!564 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !561, file: !451, line: 60, baseType: !461, size: 128, offset: 32)
!565 = !DILocation(line: 206, column: 28, scope: !521)
!566 = !DILocation(line: 206, column: 5, scope: !521)
!567 = !DILocation(line: 210, column: 5, scope: !521)
!568 = !DILocalVariable(name: "res_get_a", scope: !521, file: !17, line: 216, type: !569)
!569 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_a_datatype", file: !451, line: 71, baseType: !570)
!570 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_a_datatype", file: !451, line: 68, size: 192, elements: !571)
!571 = !{!572, !573}
!572 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !570, file: !451, line: 69, baseType: !524, size: 64)
!573 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !570, file: !451, line: 70, baseType: !461, size: 128, offset: 64)
!574 = !DILocation(line: 216, column: 29, scope: !521)
!575 = !DILocation(line: 216, column: 5, scope: !521)
!576 = !DILocation(line: 220, column: 5, scope: !521)
!577 = !DILocation(line: 224, column: 15, scope: !521)
!578 = !DILocation(line: 224, column: 21, scope: !521)
!579 = !DILocalVariable(name: "ctx", scope: !521, file: !17, line: 226, type: !9)
!580 = !DILocation(line: 226, column: 12, scope: !521)
!581 = !DILocation(line: 226, column: 18, scope: !521)
!582 = !DILocation(line: 227, column: 33, scope: !521)
!583 = !DILocation(line: 227, column: 15, scope: !521)
!584 = !DILocation(line: 227, column: 13, scope: !521)
!585 = !DILocation(line: 228, column: 40, scope: !521)
!586 = !DILocation(line: 228, column: 15, scope: !521)
!587 = !DILocation(line: 228, column: 13, scope: !521)
!588 = !DILocation(line: 229, column: 5, scope: !521)
!589 = !DILocation(line: 239, column: 22, scope: !521)
!590 = !DILocation(line: 239, column: 31, scope: !521)
!591 = !DILocation(line: 239, column: 51, scope: !521)
!592 = !DILocation(line: 239, column: 5, scope: !521)
!593 = !DILocation(line: 241, column: 26, scope: !521)
!594 = !DILocation(line: 241, column: 35, scope: !521)
!595 = !DILocation(line: 241, column: 55, scope: !521)
!596 = !DILocation(line: 241, column: 5, scope: !521)
!597 = !DILocation(line: 243, column: 15, scope: !521)
!598 = !DILocation(line: 243, column: 5, scope: !521)
!599 = !DILocation(line: 244, column: 15, scope: !521)
!600 = !DILocation(line: 244, column: 5, scope: !521)
!601 = !DILocation(line: 245, column: 22, scope: !521)
!602 = !DILocation(line: 245, column: 5, scope: !521)
!603 = !DILocation(line: 253, column: 23, scope: !521)
!604 = !DILocation(line: 253, column: 5, scope: !521)
!605 = distinct !DISubprogram(name: "_master_rpc_init", scope: !17, file: !17, line: 259, type: !606, scopeLine: 259, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!606 = !DISubroutineType(types: !607)
!607 = !{null}
!608 = !DILocation(line: 260, column: 5, scope: !605)
!609 = !DILocation(line: 261, column: 1, scope: !605)
