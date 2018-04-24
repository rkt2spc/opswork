const collections = [];
const names = db.getCollectionNames();
for (let i = 0; i < names.length; ++i) {
    const stats = db.getCollection(names[i]).stats();
    collections.push({ name: names[i], size: stats.size });
}

collections.sort((a, b) => a.size > b.size);
for (let i = 0; i < collections.length; ++i) {
    const { name, size } = collections[i];
    print('=============================')
    print(name)
    // print(size, 'B')
    // print(Math.round(size / 1024 * 100) / 100, 'KB')
    print(Math.round(size / 1024 / 1024 * 100) / 100, 'MB')
}
