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
@_notify_next_tag.psocket = internal global i8* null, align 8, !dbg !26
@_notify_next_tag.ssocket = internal global i8* null, align 8, !dbg !29
@.str = private unnamed_addr constant [12 x i8] c"TAG_NEXTRPC\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [48 x i8] c"./partitioned/multithreaded/purple/purple_rpc.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [9 x i8] c"TAG_OKAY\00", section "llvm.metadata"
@_rpc_get_a.inited = internal global i32 0, align 4, !dbg !31
@_rpc_get_a.psocket = internal global i8* null, align 8, !dbg !38
@_rpc_get_a.ssocket = internal global i8* null, align 8, !dbg !40
@.str.3 = private unnamed_addr constant [18 x i8] c"TAG_REQUEST_GET_A\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [19 x i8] c"TAG_RESPONSE_GET_A\00", section "llvm.metadata"
@.str.5 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_subpurple\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"ipc:///tmp/sock_pubpurple\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_hal_init(i8* %0, i8* %1) #0 !dbg !46 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !49, metadata !DIExpression()), !dbg !50
  store i8* %1, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !51, metadata !DIExpression()), !dbg !52
  %5 = load i8*, i8** %3, align 8, !dbg !53
  %6 = call i8* @xdc_set_in(i8* %5), !dbg !54
  %7 = load i8*, i8** %4, align 8, !dbg !55
  %8 = call i8* @xdc_set_out(i8* %7), !dbg !56
  call void @xdc_register(void (i8*, i8*, i64*)* @nextrpc_data_encode, void (i8*, i8*, i64*)* @nextrpc_data_decode, i32 1), !dbg !57
  call void @xdc_register(void (i8*, i8*, i64*)* @okay_data_encode, void (i8*, i8*, i64*)* @okay_data_decode, i32 2), !dbg !58
  call void @xdc_register(void (i8*, i8*, i64*)* @request_get_a_data_encode, void (i8*, i8*, i64*)* @request_get_a_data_decode, i32 3), !dbg !59
  call void @xdc_register(void (i8*, i8*, i64*)* @response_get_a_data_encode, void (i8*, i8*, i64*)* @response_get_a_data_decode, i32 4), !dbg !60
  ret void, !dbg !61
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
  call void @llvm.dbg.declare(metadata %struct._tag** %2, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata %struct._tag* %3, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata %struct._tag* %4, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata %struct._nextrpc_datatype* %5, metadata !68, metadata !DIExpression()), !dbg !91
  %8 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !92
  call void @llvm.var.annotation(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 138), !dbg !92
  call void @tag_write(%struct._tag* %3, i32 2, i32 2, i32 1), !dbg !93
  call void @llvm.dbg.declare(metadata %struct._okay_datatype* %6, metadata !94, metadata !DIExpression()), !dbg !100
  %9 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !101
  call void @llvm.var.annotation(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 148), !dbg !101
  call void @tag_write(%struct._tag* %4, i32 1, i32 1, i32 2), !dbg !102
  %10 = load i32, i32* @_notify_next_tag.inited, align 4, !dbg !103
  %11 = icmp ne i32 %10, 0, !dbg !103
  br i1 %11, label %22, label %12, !dbg !105

12:                                               ; preds = %1
  store i32 1, i32* @_notify_next_tag.inited, align 4, !dbg !106
  %13 = call i8* @xdc_pub_socket(), !dbg !108
  store i8* %13, i8** @_notify_next_tag.psocket, align 8, !dbg !109
  %14 = bitcast { i64, i32 }* %7 to i8*, !dbg !110
  %15 = bitcast %struct._tag* %4 to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %14, i8* align 1 %15, i64 12, i1 false), !dbg !110
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 0, !dbg !110
  %17 = load i64, i64* %16, align 1, !dbg !110
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %7, i32 0, i32 1, !dbg !110
  %19 = load i32, i32* %18, align 1, !dbg !110
  %20 = call i8* @xdc_sub_socket(i64 %17, i32 %19), !dbg !110
  store i8* %20, i8** @_notify_next_tag.ssocket, align 8, !dbg !111
  %21 = call i32 @sleep(i32 1), !dbg !112
  br label %22, !dbg !113

22:                                               ; preds = %12, %1
  %23 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !114
  %24 = getelementptr inbounds %struct._tag, %struct._tag* %23, i32 0, i32 0, !dbg !115
  %25 = load i32, i32* %24, align 1, !dbg !115
  %26 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 0, !dbg !116
  store i32 %25, i32* %26, align 1, !dbg !117
  %27 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !118
  %28 = getelementptr inbounds %struct._tag, %struct._tag* %27, i32 0, i32 1, !dbg !119
  %29 = load i32, i32* %28, align 1, !dbg !119
  %30 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 1, !dbg !120
  store i32 %29, i32* %30, align 1, !dbg !121
  %31 = load %struct._tag*, %struct._tag** %2, align 8, !dbg !122
  %32 = getelementptr inbounds %struct._tag, %struct._tag* %31, i32 0, i32 2, !dbg !123
  %33 = load i32, i32* %32, align 1, !dbg !123
  %34 = getelementptr inbounds %struct._nextrpc_datatype, %struct._nextrpc_datatype* %5, i32 0, i32 2, !dbg !124
  store i32 %33, i32* %34, align 1, !dbg !125
  %35 = load i8*, i8** @_notify_next_tag.psocket, align 8, !dbg !126
  %36 = bitcast %struct._nextrpc_datatype* %5 to i8*, !dbg !127
  call void @xdc_asyn_send(i8* %35, i8* %36, %struct._tag* %3), !dbg !128
  %37 = load i8*, i8** @_notify_next_tag.ssocket, align 8, !dbg !129
  %38 = bitcast %struct._okay_datatype* %6 to i8*, !dbg !130
  call void @xdc_blocking_recv(i8* %37, i8* %38, %struct._tag* %4), !dbg !131
  ret void, !dbg !132
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
define dso_local double @_rpc_get_a() #0 !dbg !33 {
  %1 = alloca %struct._tag, align 1
  %2 = alloca %struct._tag, align 1
  %3 = alloca %struct._request_get_a_datatype, align 1
  %4 = alloca %struct._response_get_a_datatype, align 1
  %5 = alloca { i64, i32 }, align 1
  call void @llvm.dbg.declare(metadata %struct._tag* %1, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata %struct._tag* %2, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata %struct._request_get_a_datatype* %3, metadata !137, metadata !DIExpression()), !dbg !143
  %6 = bitcast %struct._request_get_a_datatype* %3 to i8*, !dbg !144
  call void @llvm.var.annotation(i8* %6, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 206), !dbg !144
  call void @tag_write(%struct._tag* %1, i32 2, i32 2, i32 3), !dbg !145
  call void @llvm.dbg.declare(metadata %struct._response_get_a_datatype* %4, metadata !146, metadata !DIExpression()), !dbg !152
  %7 = bitcast %struct._response_get_a_datatype* %4 to i8*, !dbg !153
  call void @llvm.var.annotation(i8* %7, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0), i32 216), !dbg !153
  call void @tag_write(%struct._tag* %2, i32 1, i32 1, i32 4), !dbg !154
  %8 = getelementptr inbounds %struct._request_get_a_datatype, %struct._request_get_a_datatype* %3, i32 0, i32 0, !dbg !155
  store i32 0, i32* %8, align 1, !dbg !156
  %9 = load i32, i32* @_rpc_get_a.inited, align 4, !dbg !157
  %10 = icmp ne i32 %9, 0, !dbg !157
  br i1 %10, label %21, label %11, !dbg !159

11:                                               ; preds = %0
  store i32 1, i32* @_rpc_get_a.inited, align 4, !dbg !160
  %12 = call i8* @xdc_pub_socket(), !dbg !162
  store i8* %12, i8** @_rpc_get_a.psocket, align 8, !dbg !163
  %13 = bitcast { i64, i32 }* %5 to i8*, !dbg !164
  %14 = bitcast %struct._tag* %2 to i8*, !dbg !164
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %13, i8* align 1 %14, i64 12, i1 false), !dbg !164
  %15 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %5, i32 0, i32 0, !dbg !164
  %16 = load i64, i64* %15, align 1, !dbg !164
  %17 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %5, i32 0, i32 1, !dbg !164
  %18 = load i32, i32* %17, align 1, !dbg !164
  %19 = call i8* @xdc_sub_socket(i64 %16, i32 %18), !dbg !164
  store i8* %19, i8** @_rpc_get_a.ssocket, align 8, !dbg !165
  %20 = call i32 @sleep(i32 1), !dbg !166
  br label %21, !dbg !167

21:                                               ; preds = %11, %0
  %22 = load i8*, i8** @_rpc_get_a.psocket, align 8, !dbg !168
  %23 = bitcast %struct._request_get_a_datatype* %3 to i8*, !dbg !169
  call void @xdc_asyn_send(i8* %22, i8* %23, %struct._tag* %1), !dbg !170
  %24 = load i8*, i8** @_rpc_get_a.ssocket, align 8, !dbg !171
  %25 = bitcast %struct._response_get_a_datatype* %4 to i8*, !dbg !172
  call void @xdc_blocking_recv(i8* %24, i8* %25, %struct._tag* %2), !dbg !173
  %26 = getelementptr inbounds %struct._response_get_a_datatype, %struct._response_get_a_datatype* %4, i32 0, i32 0, !dbg !174
  %27 = load double, double* %26, align 1, !dbg !174
  ret double %27, !dbg !175
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_master_rpc_init() #0 !dbg !176 {
  call void @_hal_init(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0)), !dbg !179
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!42, !43, !44}
!llvm.ident = !{!45}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "inited", scope: !2, file: !3, line: 130, type: !37, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "_notify_next_tag", scope: !3, file: !3, line: 117, type: !4, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
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
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !20, producer: "clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !22, globals: !25, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "partitioned/multithreaded/purple/purple_rpc.c", directory: "/workspaces/build/apps/examples/example1")
!21 = !{}
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!0, !26, !29, !31, !38, !40}
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "psocket", scope: !2, file: !3, line: 131, type: !28, isLocal: true, isDefinition: true)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "ssocket", scope: !2, file: !3, line: 132, type: !28, isLocal: true, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "inited", scope: !33, file: !3, line: 198, type: !37, isLocal: true, isDefinition: true)
!33 = distinct !DISubprogram(name: "_rpc_get_a", scope: !3, file: !3, line: 185, type: !34, scopeLine: 185, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!34 = !DISubroutineType(types: !35)
!35 = !{!36}
!36 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "psocket", scope: !33, file: !3, line: 199, type: !28, isLocal: true, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "ssocket", scope: !33, file: !3, line: 200, type: !28, isLocal: true, isDefinition: true)
!42 = !{i32 7, !"Dwarf Version", i32 4}
!43 = !{i32 2, !"Debug Info Version", i32 3}
!44 = !{i32 1, !"wchar_size", i32 4}
!45 = !{!"clang version 10.0.1 (https://github.com/gaps-closure/llvm-project 4954dd8b02af91d5e8d4815824208b6004f667a8)"}
!46 = distinct !DISubprogram(name: "_hal_init", scope: !3, file: !3, line: 106, type: !47, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !23, !23}
!49 = !DILocalVariable(name: "inuri", arg: 1, scope: !46, file: !3, line: 106, type: !23)
!50 = !DILocation(line: 106, column: 22, scope: !46)
!51 = !DILocalVariable(name: "outuri", arg: 2, scope: !46, file: !3, line: 106, type: !23)
!52 = !DILocation(line: 106, column: 35, scope: !46)
!53 = !DILocation(line: 108, column: 16, scope: !46)
!54 = !DILocation(line: 108, column: 5, scope: !46)
!55 = !DILocation(line: 109, column: 17, scope: !46)
!56 = !DILocation(line: 109, column: 5, scope: !46)
!57 = !DILocation(line: 110, column: 5, scope: !46)
!58 = !DILocation(line: 111, column: 5, scope: !46)
!59 = !DILocation(line: 112, column: 5, scope: !46)
!60 = !DILocation(line: 113, column: 5, scope: !46)
!61 = !DILocation(line: 115, column: 1, scope: !46)
!62 = !DILocalVariable(name: "n_tag", arg: 1, scope: !2, file: !3, line: 117, type: !6)
!63 = !DILocation(line: 117, column: 33, scope: !2)
!64 = !DILocalVariable(name: "t_tag", scope: !2, file: !3, line: 133, type: !7)
!65 = !DILocation(line: 133, column: 14, scope: !2)
!66 = !DILocalVariable(name: "o_tag", scope: !2, file: !3, line: 134, type: !7)
!67 = !DILocation(line: 134, column: 14, scope: !2)
!68 = !DILocalVariable(name: "nxt", scope: !2, file: !3, line: 138, type: !69)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "nextrpc_datatype", file: !70, line: 39, baseType: !71)
!70 = !DIFile(filename: "./partitioned/multithreaded/autogen/codec.h", directory: "/workspaces/build/apps/examples/example1")
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_nextrpc_datatype", file: !70, line: 34, size: 224, elements: !72)
!72 = !{!73, !77, !78, !79}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "mux", scope: !71, file: !70, line: 35, baseType: !74, size: 32)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !75, line: 26, baseType: !76)
!75 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !15, line: 41, baseType: !37)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "sec", scope: !71, file: !70, line: 36, baseType: !74, size: 32, offset: 32)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "typ", scope: !71, file: !70, line: 37, baseType: !74, size: 32, offset: 64)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !71, file: !70, line: 38, baseType: !80, size: 128, offset: 96)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "trailer_datatype", file: !70, line: 24, baseType: !81)
!81 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_trailer_datatype", file: !70, line: 18, size: 128, elements: !82)
!82 = !{!83, !84, !85, !86, !90}
!83 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !81, file: !70, line: 19, baseType: !12, size: 32)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "rqr", scope: !81, file: !70, line: 20, baseType: !12, size: 32, offset: 32)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "oid", scope: !81, file: !70, line: 21, baseType: !12, size: 32, offset: 64)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "mid", scope: !81, file: !70, line: 22, baseType: !87, size: 16, offset: 96)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !13, line: 25, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !15, line: 40, baseType: !89)
!89 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "crc", scope: !81, file: !70, line: 23, baseType: !87, size: 16, offset: 112)
!91 = !DILocation(line: 138, column: 22, scope: !2)
!92 = !DILocation(line: 138, column: 5, scope: !2)
!93 = !DILocation(line: 144, column: 5, scope: !2)
!94 = !DILocalVariable(name: "okay", scope: !2, file: !3, line: 148, type: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "okay_datatype", file: !70, line: 51, baseType: !96)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_okay_datatype", file: !70, line: 48, size: 160, elements: !97)
!97 = !{!98, !99}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !96, file: !70, line: 49, baseType: !74, size: 32)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !96, file: !70, line: 50, baseType: !80, size: 128, offset: 32)
!100 = !DILocation(line: 148, column: 19, scope: !2)
!101 = !DILocation(line: 148, column: 5, scope: !2)
!102 = !DILocation(line: 154, column: 5, scope: !2)
!103 = !DILocation(line: 162, column: 10, scope: !104)
!104 = distinct !DILexicalBlock(scope: !2, file: !3, line: 162, column: 9)
!105 = !DILocation(line: 162, column: 9, scope: !2)
!106 = !DILocation(line: 163, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !3, line: 162, column: 18)
!108 = !DILocation(line: 164, column: 19, scope: !107)
!109 = !DILocation(line: 164, column: 17, scope: !107)
!110 = !DILocation(line: 165, column: 19, scope: !107)
!111 = !DILocation(line: 165, column: 17, scope: !107)
!112 = !DILocation(line: 166, column: 9, scope: !107)
!113 = !DILocation(line: 167, column: 5, scope: !107)
!114 = !DILocation(line: 169, column: 15, scope: !2)
!115 = !DILocation(line: 169, column: 22, scope: !2)
!116 = !DILocation(line: 169, column: 9, scope: !2)
!117 = !DILocation(line: 169, column: 13, scope: !2)
!118 = !DILocation(line: 170, column: 15, scope: !2)
!119 = !DILocation(line: 170, column: 22, scope: !2)
!120 = !DILocation(line: 170, column: 9, scope: !2)
!121 = !DILocation(line: 170, column: 13, scope: !2)
!122 = !DILocation(line: 171, column: 15, scope: !2)
!123 = !DILocation(line: 171, column: 22, scope: !2)
!124 = !DILocation(line: 171, column: 9, scope: !2)
!125 = !DILocation(line: 171, column: 13, scope: !2)
!126 = !DILocation(line: 179, column: 19, scope: !2)
!127 = !DILocation(line: 179, column: 28, scope: !2)
!128 = !DILocation(line: 179, column: 5, scope: !2)
!129 = !DILocation(line: 180, column: 23, scope: !2)
!130 = !DILocation(line: 180, column: 32, scope: !2)
!131 = !DILocation(line: 180, column: 5, scope: !2)
!132 = !DILocation(line: 183, column: 1, scope: !2)
!133 = !DILocalVariable(name: "t_tag", scope: !33, file: !3, line: 201, type: !7)
!134 = !DILocation(line: 201, column: 14, scope: !33)
!135 = !DILocalVariable(name: "o_tag", scope: !33, file: !3, line: 202, type: !7)
!136 = !DILocation(line: 202, column: 14, scope: !33)
!137 = !DILocalVariable(name: "req_get_a", scope: !33, file: !3, line: 206, type: !138)
!138 = !DIDerivedType(tag: DW_TAG_typedef, name: "request_get_a_datatype", file: !70, line: 61, baseType: !139)
!139 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_request_get_a_datatype", file: !70, line: 58, size: 160, elements: !140)
!140 = !{!141, !142}
!141 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !139, file: !70, line: 59, baseType: !74, size: 32)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !139, file: !70, line: 60, baseType: !80, size: 128, offset: 32)
!143 = !DILocation(line: 206, column: 28, scope: !33)
!144 = !DILocation(line: 206, column: 5, scope: !33)
!145 = !DILocation(line: 212, column: 5, scope: !33)
!146 = !DILocalVariable(name: "res_get_a", scope: !33, file: !3, line: 216, type: !147)
!147 = !DIDerivedType(tag: DW_TAG_typedef, name: "response_get_a_datatype", file: !70, line: 71, baseType: !148)
!148 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_response_get_a_datatype", file: !70, line: 68, size: 192, elements: !149)
!149 = !{!150, !151}
!150 = !DIDerivedType(tag: DW_TAG_member, name: "ret", scope: !148, file: !70, line: 69, baseType: !36, size: 64)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "trailer", scope: !148, file: !70, line: 70, baseType: !80, size: 128, offset: 64)
!152 = !DILocation(line: 216, column: 29, scope: !33)
!153 = !DILocation(line: 216, column: 5, scope: !33)
!154 = !DILocation(line: 222, column: 5, scope: !33)
!155 = !DILocation(line: 224, column: 15, scope: !33)
!156 = !DILocation(line: 224, column: 21, scope: !33)
!157 = !DILocation(line: 231, column: 10, scope: !158)
!158 = distinct !DILexicalBlock(scope: !33, file: !3, line: 231, column: 9)
!159 = !DILocation(line: 231, column: 9, scope: !33)
!160 = !DILocation(line: 232, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !3, line: 231, column: 18)
!162 = !DILocation(line: 233, column: 19, scope: !161)
!163 = !DILocation(line: 233, column: 17, scope: !161)
!164 = !DILocation(line: 234, column: 19, scope: !161)
!165 = !DILocation(line: 234, column: 17, scope: !161)
!166 = !DILocation(line: 235, column: 9, scope: !161)
!167 = !DILocation(line: 236, column: 5, scope: !161)
!168 = !DILocation(line: 247, column: 19, scope: !33)
!169 = !DILocation(line: 247, column: 28, scope: !33)
!170 = !DILocation(line: 247, column: 5, scope: !33)
!171 = !DILocation(line: 249, column: 23, scope: !33)
!172 = !DILocation(line: 249, column: 32, scope: !33)
!173 = !DILocation(line: 249, column: 5, scope: !33)
!174 = !DILocation(line: 253, column: 23, scope: !33)
!175 = !DILocation(line: 253, column: 5, scope: !33)
!176 = distinct !DISubprogram(name: "_master_rpc_init", scope: !3, file: !3, line: 259, type: !177, scopeLine: 259, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!177 = !DISubroutineType(types: !178)
!178 = !{null}
!179 = !DILocation(line: 260, column: 5, scope: !176)
!180 = !DILocation(line: 261, column: 1, scope: !176)
