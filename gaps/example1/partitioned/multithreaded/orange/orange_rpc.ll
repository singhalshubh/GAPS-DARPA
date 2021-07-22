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
@.str.3 = private unnamed_addr constant [18 x i8] c"TAG_REQUEST_GET_A\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [19 x i8] c"TAG_RESPONSE_GET_A\00", section "llvm.metadata"
@.str.5 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_suborange\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_puborange\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_hal_init(i8* %0, i8* %1) #0 !dbg !43 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !46, metadata !DIExpression()), !dbg !47
  store i8* %1, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !48, metadata !DIExpression()), !dbg !49
  %5 = load i8*, i8** %3, align 8, !dbg !50
  %6 = call i8* @xdc_set_in(i8* %5), !dbg !51
  %7 = load i8*, i8** %4, align 8, !dbg !52
  %8 = call i8* @xdc_set_out(i8* %7), !dbg !53
  call void @xdc_register(void (i8*, i8*, i64*)* @nextrpc_data_encode, void (i8*, i8*, i64*)* @nextrpc_data_decode, i32 1), !dbg !54
  call void @xdc_register(void (i8*, i8*, i64*)* @okay_data_encode, void (i8*, i8*, i64*)* @okay_data_decode, i32 2), !dbg !55
  call void @xdc_register(void (i8*, i8*, i64*)* @request_get_a_data_encode, void (i8*, i8*, i64*)* @request_get_a_data_decode, i32 3), !dbg !56
  call void @xdc_register(void (i8*, i8*, i64*)* @response_get_a_data_encode, void (i8*, i8*, i64*)* @response_get_a_data_decode, i32 4), !dbg !57
  ret void, !dbg !58
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
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata %struct._nextrpc_datatype* %5, metadata !65, metadata !DIExpression()), !dbg !88
  %8 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !89
  call void @llvm.var.annotation(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 138), !dbg !89
  call void @llvm.dbg.declare(metadata %struct._okay_datatype* %6, metadata !90, metadata !DIExpression()), !dbg !96
  %9 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !97
  call void @llvm.var.annotation(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 143), !dbg !97
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 1), !dbg !98
  %10 = load i32, i32* @_handle_nextrpc.inited, align 4, !dbg !99
  %11 = icmp ne i32 %10, 0, !dbg !99
  br i1 %11, label %22, label %12, !dbg !101

12:                                               ; preds = %1
  store i32 1, i32* @_handle_nextrpc.inited, align 4, !dbg !102
  %13 = call i8* @xdc_pub_socket(), !dbg !104
  store i8* %13, i8** @_handle_nextrpc.psocket, align 8, !dbg !105
  %14 = bitcast { i64, i32 }* %7 to i8*, !dbg !106
  %15 = bitcast %struct._tag* %3 to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %14, i8* align 1 %15, i64 12, i1 false), !dbg !106
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !106
  %17 = load i64, i64* %16, align 1, !dbg !106
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !106
  %19 = load i32, i32* %18, align 1, !dbg !106
  %20 = call i8* @xdc_sub_socket(i64 %17, i32 %19), !dbg !106
  store i8* %20, i8** @_handle_nextrpc.ssocket, align 8, !dbg !107
  %21 = call i32 @sleep(i32 1), !dbg !108
  br label %22, !dbg !109

22:                                               ; preds = %12, %1
  %23 = load i8*, i8** @_handle_nextrpc.ssocket, align 8, !dbg !110
  %24 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !111
  call void @xdc_blocking_recv(i8* %23, i8* %24, %struct._tag* %3), !dbg !112
  call void @tag_write(%struct._tag* %4, i32 1, i32 1, i32 2), !dbg !113
  %25 = getelementptr inbounds %struct._okay_datatype, %struct._okay_datatype* %6, i32 0, i32 0, !dbg !114
  store i32 0, i32* %25, align 1, !dbg !115
  %26 = load i8*, i8** @_handle_nextrpc.psocket, align 8, !dbg !116
  %27 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !117
  call void @xdc_asyn_send(i8* %26, i8* %27, %struct._tag* %4), !dbg !118
  %28 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 0, !dbg !119
  %29 = load i32, i32* %28, align 1, !dbg !119
  %30 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !120
  %31 = getelementptr inbounds %struct._tag, %struct._tag* %30, i32 0, i32 0, !dbg !121
  store i32 %29, i32* %31, align 1, !dbg !122
  %32 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 1, !dbg !123
  %33 = load i32, i32* %32, align 1, !dbg !123
  %34 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !124
  %35 = getelementptr inbounds %struct._tag, %struct._tag* %34, i32 0, i32 1, !dbg !125
  store i32 %33, i32* %35, align 1, !dbg !126
  %36 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 2, !dbg !127
  %37 = load i32, i32* %36, align 1, !dbg !127
  %38 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !128
  %39 = getelementptr inbounds %struct._tag, %struct._tag* %38, i32 0, i32 2, !dbg !129
  store i32 %37, i32* %39, align 1, !dbg !130
  ret void, !dbg !131
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
  store %struct._tag* %0, %struct._tag** %2, align 8
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %5, metadata !138, metadata !DIExpression()), !dbg !144
  %8 = bitcast %struct._request_get_a_datatype* %5 to i8*, !dbg !145
  call void @llvm.var.annotation(i8* %8, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 204), !dbg !145
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 3), !dbg !146
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %6, metadata !147, metadata !DIExpression()), !dbg !154
  %9 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !155
  call void @llvm.var.annotation(i8* %9, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 214), !dbg !155
  call void @tag_write(%struct._tag* %4, i32 1, i32 1, i32 4), !dbg !156
  %10 = load i32, i32* @_handle_request_get_a.inited, align 4, !dbg !157
  %11 = icmp ne i32 %10, 0, !dbg !157
  br i1 %11, label %22, label %12, !dbg !159

12:                                               ; preds = %1
  store i32 1, i32* @_handle_request_get_a.inited, align 4, !dbg !160
  %13 = call i8* @xdc_pub_socket(), !dbg !162
  store i8* %13, i8** @_handle_request_get_a.psocket, align 8, !dbg !163
  %14 = bitcast { i64, i32 }* %7 to i8*, !dbg !164
  %15 = bitcast %struct._tag* %3 to i8*, !dbg !164
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %14, i8* align 1 %15, i64 12, i1 false), !dbg !164
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !164
  %17 = load i64, i64* %16, align 1, !dbg !164
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !164
  %19 = load i32, i32* %18, align 1, !dbg !164
  %20 = call i8* @xdc_sub_socket(i64 %17, i32 %19), !dbg !164
  store i8* %20, i8** @_handle_request_get_a.ssocket, align 8, !dbg !165
  %21 = call i32 @sleep(i32 1), !dbg !166
  br label %22, !dbg !167

22:                                               ; preds = %12, %1
  %23 = load i8*, i8** @_handle_request_get_a.ssocket, align 8, !dbg !168
  %24 = bitcast %struct._request_get_a_datatype* %5 to i8*, !dbg !169
  call void @xdc_blocking_recv(i8* %23, i8* %24, %struct._tag* %3), !dbg !170
  %25 = call double (...) @get_a(), !dbg !171
  %26 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %6, i32 0, i32 0, !dbg !172
  store double %25, double* %26, align 1, !dbg !173
  %27 = load i8*, i8** @_handle_request_get_a.psocket, align 8, !dbg !174
  %28 = bitcast %struct._response_get_a_datatype* %6 to i8*, !dbg !175
  call void @xdc_asyn_send(i8* %27, i8* %28, %struct._tag* %4), !dbg !176
  ret void, !dbg !177
}

declare dso_local double @get_a(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_wrapper_nextrpc(i8* %0) #0 !dbg !178 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !181, metadata !DIExpression()), !dbg !182
  br label %3, !dbg !182

3:                                                ; preds = %1, %3
  %4 = load i8*, i8** %2, align 8, !dbg !183
  %5 = bitcast i8* %4 to %struct._tag*, !dbg !183
  call void @_handle_nextrpc(%struct._tag* %5), !dbg !183
  br label %3, !dbg !182, !llvm.loop !185
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_wrapper_request_get_a(i8* %0) #0 !dbg !186 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !187, metadata !DIExpression()), !dbg !188
  br label %3, !dbg !188

3:                                                ; preds = %1, %3
  %4 = load i8*, i8** %2, align 8, !dbg !189
  %5 = bitcast i8* %4 to %struct._tag*, !dbg !189
  call void @_handle_request_get_a(%struct._tag* %5), !dbg !189
  br label %3, !dbg !188, !llvm.loop !191
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_slave_rpc_loop() #0 !dbg !192 {
  %1 = alloca %struct._tag, align 1
  %2 = alloca [2 x i64], align 16
  %3 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct._tag* %1, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata [2 x i64]* %2, metadata !197, metadata !DIExpression()), !dbg !204
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0)), !dbg !205
  %4 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 0, !dbg !206
  %5 = bitcast %struct._tag* %1 to i8*, !dbg !207
  %6 = call i32 @pthread_create(i64* %4, %union.pthread_attr_t* null, i8* (i8*)* @_wrapper_nextrpc, i8* %5) #6, !dbg !208
  %7 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 1, !dbg !209
  %8 = bitcast %struct._tag* %1 to i8*, !dbg !210
  %9 = call i32 @pthread_create(i64* %7, %union.pthread_attr_t* null, i8* (i8*)* @_wrapper_request_get_a, i8* %8) #6, !dbg !211
  call void @llvm.dbg.declare(metadata i32* %3, metadata !212, metadata !DIExpression()), !dbg !214
  store i32 0, i32* %3, align 4, !dbg !214
  br label %10, !dbg !215

10:                                               ; preds = %19, %0
  %11 = load i32, i32* %3, align 4, !dbg !216
  %12 = icmp slt i32 %11, 2, !dbg !218
  br i1 %12, label %13, label %22, !dbg !219

13:                                               ; preds = %10
  %14 = load i32, i32* %3, align 4, !dbg !220
  %15 = sext i32 %14 to i64, !dbg !221
  %16 = getelementptr inbounds [2 x i64], [2 x i64]* %2, i64 0, i64 %15, !dbg !221
  %17 = load i64, i64* %16, align 8, !dbg !221
  %18 = call i32 @pthread_join(i64 %17, i8** null), !dbg !222
  br label %19, !dbg !222

19:                                               ; preds = %13
  %20 = load i32, i32* %3, align 4, !dbg !223
  %21 = add nsw i32 %20, 1, !dbg !223
  store i32 %21, i32* %3, align 4, !dbg !223
  br label %10, !dbg !224, !llvm.loop !225

22:                                               ; preds = %10
  ret i32 0, !dbg !227
}

; Function Attrs: nounwind
declare !callback !228 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #5

declare dso_local i32 @pthread_join(i64, i8**) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!39, !40, !41}
!llvm.ident = !{!42}

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
!25 = !{!0, !26, !29, !31, !35, !37}
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
!39 = !{i32 7, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{i32 1, !"wchar_size", i32 4}
!42 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!43 = distinct !DISubprogram(name: "_hal_init", scope: !3, file: !3, line: 106, type: !44, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!44 = !DISubroutineType(types: !45)
!45 = !{null, !23, !23}
!46 = !DILocalVariable(name: "inuri", arg: 1, scope: !43, file: !3, line: 106, type: !23)
!47 = !DILocation(line: 106, column: 22, scope: !43)
!48 = !DILocalVariable(name: "outuri", arg: 2, scope: !43, file: !3, line: 106, type: !23)
!49 = !DILocation(line: 106, column: 35, scope: !43)
!50 = !DILocation(line: 108, column: 16, scope: !43)
!51 = !DILocation(line: 108, column: 5, scope: !43)
!52 = !DILocation(line: 109, column: 17, scope: !43)
!53 = !DILocation(line: 109, column: 5, scope: !43)
!54 = !DILocation(line: 110, column: 5, scope: !43)
!55 = !DILocation(line: 111, column: 5, scope: !43)
!56 = !DILocation(line: 112, column: 5, scope: !43)
!57 = !DILocation(line: 113, column: 5, scope: !43)
!58 = !DILocation(line: 115, column: 1, scope: !43)
!59 = !DILocalVariable(name: "n_tag", arg: 1, scope: !2, file: !3, line: 117, type: !6)
!60 = !DILocation(line: 117, column: 32, scope: !2)
!61 = !DILocalVariable(name: "t_tag", scope: !2, file: !3, line: 133, type: !7)
!62 = !DILocation(line: 133, column: 14, scope: !2)
!63 = !DILocalVariable(name: "o_tag", scope: !2, file: !3, line: 134, type: !7)
!64 = !DILocation(line: 134, column: 14, scope: !2)
!65 = !DILocalVariable(name: "nxt", scope: !2, file: !3, line: 138, type: !66)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "nextrpc_datatype", file: !67, line: 39, baseType: !68)
!67 = !DIFile(filename: "./partitioned/multithreaded/autogen/codec.h", directory: "/workspaces/build/apps/examples/example1")
!68 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_nextrpc_datatype", file: !67, line: 34, size: 224, elements: !69)
!69 = !{!70, !74, !75, !76}
!70 = !DIDerivedType(tag: DW_TAG_member, name: "mux", scope: !68, file: !67, line: 35, baseType: !71, size: 32)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !72, line: 26, baseType: !73)
!72 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !15, line: 41, baseType: !34)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "sec", scope: !68, file: !67, line: 36, baseType: !71, size: 32, offset: 32)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "typ", scope: !68, file: !67, line: 37, baseType: !71, size: 32, offset: 64)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !68, file: !67, line: 38, baseType: !77, size: 128, offset: 96)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "trailer_datatype", file: !67, line: 24, baseType: !78)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_trailer_datatype", file: !67, line: 18, size: 128, elements: !79)
!79 = !{!80, !81, !82, !83, !87}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !78, file: !67, line: 19, baseType: !12, size: 32)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "rqr", scope: !78, file: !67, line: 20, baseType: !12, size: 32, offset: 32)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "oid", scope: !78, file: !67, line: 21, baseType: !12, size: 32, offset: 64)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "mid", scope: !78, file: !67, line: 22, baseType: !84, size: 16, offset: 96)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !13, line: 25, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !15, line: 40, baseType: !86)
!86 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "crc", scope: !78, file: !67, line: 23, baseType: !84, size: 16, offset: 112)
!88 = !DILocation(line: 138, column: 22, scope: !2)
!89 = !DILocation(line: 138, column: 5, scope: !2)
!90 = !DILocalVariable(name: "okay", scope: !2, file: !3, line: 143, type: !91)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "okay_datatype", file: !67, line: 51, baseType: !92)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_okay_datatype", file: !67, line: 48, size: 160, elements: !93)
!93 = !{!94, !95}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !92, file: !67, line: 49, baseType: !71, size: 32)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !92, file: !67, line: 50, baseType: !77, size: 128, offset: 32)
!96 = !DILocation(line: 143, column: 19, scope: !2)
!97 = !DILocation(line: 143, column: 5, scope: !2)
!98 = !DILocation(line: 149, column: 5, scope: !2)
!99 = !DILocation(line: 157, column: 10, scope: !100)
!100 = distinct !DILexicalBlock(scope: !2, file: !3, line: 157, column: 9)
!101 = !DILocation(line: 157, column: 9, scope: !2)
!102 = !DILocation(line: 158, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !3, line: 157, column: 18)
!104 = !DILocation(line: 159, column: 19, scope: !103)
!105 = !DILocation(line: 159, column: 17, scope: !103)
!106 = !DILocation(line: 160, column: 19, scope: !103)
!107 = !DILocation(line: 160, column: 17, scope: !103)
!108 = !DILocation(line: 161, column: 9, scope: !103)
!109 = !DILocation(line: 162, column: 5, scope: !103)
!110 = !DILocation(line: 173, column: 23, scope: !2)
!111 = !DILocation(line: 173, column: 32, scope: !2)
!112 = !DILocation(line: 173, column: 5, scope: !2)
!113 = !DILocation(line: 174, column: 5, scope: !2)
!114 = !DILocation(line: 175, column: 10, scope: !2)
!115 = !DILocation(line: 175, column: 12, scope: !2)
!116 = !DILocation(line: 176, column: 19, scope: !2)
!117 = !DILocation(line: 176, column: 28, scope: !2)
!118 = !DILocation(line: 176, column: 5, scope: !2)
!119 = !DILocation(line: 178, column: 22, scope: !2)
!120 = !DILocation(line: 178, column: 5, scope: !2)
!121 = !DILocation(line: 178, column: 12, scope: !2)
!122 = !DILocation(line: 178, column: 16, scope: !2)
!123 = !DILocation(line: 179, column: 22, scope: !2)
!124 = !DILocation(line: 179, column: 5, scope: !2)
!125 = !DILocation(line: 179, column: 12, scope: !2)
!126 = !DILocation(line: 179, column: 16, scope: !2)
!127 = !DILocation(line: 180, column: 22, scope: !2)
!128 = !DILocation(line: 180, column: 5, scope: !2)
!129 = !DILocation(line: 180, column: 12, scope: !2)
!130 = !DILocation(line: 180, column: 16, scope: !2)
!131 = !DILocation(line: 181, column: 1, scope: !2)
!132 = !DILocalVariable(name: "tag", arg: 1, scope: !33, file: !3, line: 183, type: !6)
!133 = !DILocation(line: 183, column: 38, scope: !33)
!134 = !DILocalVariable(name: "t_tag", scope: !33, file: !3, line: 199, type: !7)
!135 = !DILocation(line: 199, column: 14, scope: !33)
!136 = !DILocalVariable(name: "o_tag", scope: !33, file: !3, line: 200, type: !7)
!137 = !DILocation(line: 200, column: 14, scope: !33)
!138 = !DILocalVariable(name: "req_get_a", scope: !33, file: !3, line: 204, type: !139)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_a_datatype", file: !67, line: 61, baseType: !140)
!140 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_a_datatype", file: !67, line: 58, size: 160, elements: !141)
!141 = !{!142, !143}
!142 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !140, file: !67, line: 59, baseType: !71, size: 32)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !140, file: !67, line: 60, baseType: !77, size: 128, offset: 32)
!144 = !DILocation(line: 204, column: 28, scope: !33)
!145 = !DILocation(line: 204, column: 5, scope: !33)
!146 = !DILocation(line: 210, column: 5, scope: !33)
!147 = !DILocalVariable(name: "res_get_a", scope: !33, file: !3, line: 214, type: !148)
!148 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_a_datatype", file: !67, line: 71, baseType: !149)
!149 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_a_datatype", file: !67, line: 68, size: 192, elements: !150)
!150 = !{!151, !153}
!151 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !149, file: !67, line: 69, baseType: !152, size: 64)
!152 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !149, file: !67, line: 70, baseType: !77, size: 128, offset: 64)
!154 = !DILocation(line: 214, column: 29, scope: !33)
!155 = !DILocation(line: 214, column: 5, scope: !33)
!156 = !DILocation(line: 220, column: 5, scope: !33)
!157 = !DILocation(line: 228, column: 10, scope: !158)
!158 = distinct !DILexicalBlock(scope: !33, file: !3, line: 228, column: 9)
!159 = !DILocation(line: 228, column: 9, scope: !33)
!160 = !DILocation(line: 229, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !3, line: 228, column: 18)
!162 = !DILocation(line: 230, column: 19, scope: !161)
!163 = !DILocation(line: 230, column: 17, scope: !161)
!164 = !DILocation(line: 231, column: 19, scope: !161)
!165 = !DILocation(line: 231, column: 17, scope: !161)
!166 = !DILocation(line: 232, column: 9, scope: !161)
!167 = !DILocation(line: 233, column: 5, scope: !161)
!168 = !DILocation(line: 238, column: 23, scope: !33)
!169 = !DILocation(line: 238, column: 32, scope: !33)
!170 = !DILocation(line: 238, column: 5, scope: !33)
!171 = !DILocation(line: 240, column: 21, scope: !33)
!172 = !DILocation(line: 240, column: 15, scope: !33)
!173 = !DILocation(line: 240, column: 19, scope: !33)
!174 = !DILocation(line: 250, column: 19, scope: !33)
!175 = !DILocation(line: 250, column: 28, scope: !33)
!176 = !DILocation(line: 250, column: 5, scope: !33)
!177 = !DILocation(line: 253, column: 1, scope: !33)
!178 = distinct !DISubprogram(name: "_wrapper_nextrpc", scope: !3, file: !3, line: 256, type: !179, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!179 = !DISubroutineType(types: !180)
!180 = !{!28, !28}
!181 = !DILocalVariable(name: "tag", arg: 1, scope: !178, file: !3, line: 256, type: !28)
!182 = !DILocation(line: 256, column: 1, scope: !178)
!183 = !DILocation(line: 256, column: 1, scope: !184)
!184 = distinct !DILexicalBlock(scope: !178, file: !3, line: 256, column: 1)
!185 = distinct !{!185, !182, !182}
!186 = distinct !DISubprogram(name: "_wrapper_request_get_a", scope: !3, file: !3, line: 257, type: !179, scopeLine: 257, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!187 = !DILocalVariable(name: "tag", arg: 1, scope: !186, file: !3, line: 257, type: !28)
!188 = !DILocation(line: 257, column: 1, scope: !186)
!189 = !DILocation(line: 257, column: 1, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !3, line: 257, column: 1)
!191 = distinct !{!191, !188, !188}
!192 = distinct !DISubprogram(name: "_slave_rpc_loop", scope: !3, file: !3, line: 259, type: !193, scopeLine: 259, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!193 = !DISubroutineType(types: !194)
!194 = !{!34}
!195 = !DILocalVariable(name: "n_tag", scope: !192, file: !3, line: 260, type: !7)
!196 = !DILocation(line: 260, column: 14, scope: !192)
!197 = !DILocalVariable(name: "tid", scope: !192, file: !3, line: 261, type: !198)
!198 = !DICompositeType(tag: DW_TAG_array_type, baseType: !199, size: 128, elements: !202)
!199 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !200, line: 27, baseType: !201)
!200 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "")
!201 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!202 = !{!203}
!203 = !DISubrange(count: 2)
!204 = !DILocation(line: 261, column: 15, scope: !192)
!205 = !DILocation(line: 262, column: 5, scope: !192)
!206 = !DILocation(line: 263, column: 21, scope: !192)
!207 = !DILocation(line: 263, column: 53, scope: !192)
!208 = !DILocation(line: 263, column: 5, scope: !192)
!209 = !DILocation(line: 264, column: 21, scope: !192)
!210 = !DILocation(line: 264, column: 59, scope: !192)
!211 = !DILocation(line: 264, column: 5, scope: !192)
!212 = !DILocalVariable(name: "i", scope: !213, file: !3, line: 265, type: !34)
!213 = distinct !DILexicalBlock(scope: !192, file: !3, line: 265, column: 5)
!214 = !DILocation(line: 265, column: 14, scope: !213)
!215 = !DILocation(line: 265, column: 10, scope: !213)
!216 = !DILocation(line: 265, column: 21, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !3, line: 265, column: 5)
!218 = !DILocation(line: 265, column: 23, scope: !217)
!219 = !DILocation(line: 265, column: 5, scope: !213)
!220 = !DILocation(line: 265, column: 55, scope: !217)
!221 = !DILocation(line: 265, column: 51, scope: !217)
!222 = !DILocation(line: 265, column: 38, scope: !217)
!223 = !DILocation(line: 265, column: 34, scope: !217)
!224 = !DILocation(line: 265, column: 5, scope: !217)
!225 = distinct !{!225, !219, !226}
!226 = !DILocation(line: 265, column: 63, scope: !213)
!227 = !DILocation(line: 266, column: 5, scope: !192)
!228 = !{!229}
!229 = !{i64 2, i64 3, i1 false}
