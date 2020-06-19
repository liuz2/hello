function getThem(theList) {
    let list1 = [];
    for (let x in theList) {
        if (x[0] == 4) {
            list1.push(x[0]);
        }
    }

    return list1;
}