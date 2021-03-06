implementation driver(){
var t: ref;
call init_tar_model();
call RS2RS_matchAll();
call IS2IS_matchAll();
call IS2RS_matchAll();
call CS2RS_matchAll();
call T2TA_matchAll();
call RS2RS_applyAll();
call IS2IS_applyAll();
call IS2RS_applyAll();
call CS2RS_applyAll();
call T2TA_applyAll();
assume !Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), read($tarHeap, t, FSM$Transition.source));
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t);
assume read($tarHeap, t, FSM$Transition.source) == null || !read($tarHeap, read($tarHeap, t, FSM$Transition.source), alloc);
assume genBy(t, _T2TA, $srcHeap, $tarHeap);
assume genBy(t, _T2TA, $srcHeap, $tarHeap) || genBy(t, _T2TB, $srcHeap, $tarHeap) || genBy(t, _T2TC, $srcHeap, $tarHeap);
assume !(genBy(read($tarHeap, t, FSM$Transition.source), _RS2RS, $srcHeap, $tarHeap) || genBy(read($tarHeap, t, FSM$Transition.source), _IS2IS, $srcHeap, $tarHeap) || genBy(read($tarHeap, t, FSM$Transition.source), _IS2RS, $srcHeap, $tarHeap) || genBy(read($tarHeap, t, FSM$Transition.source), _CS2RS, $srcHeap, $tarHeap));
assert false;
}

