'use strict';

/* eslint-env node, mocha */

const expect = require('chai').expect;
const sqlResult = require('../../../lib/DevAPI/SqlResult');
const Column = require('../../../lib/DevAPI/Column');

describe('SqlResult', () => {
    context('fetchAll()', () => {
        it('returns an empty array when there are no items in the result-set', () => {
            expect(sqlResult().fetchAll()).to.deep.equal([]);
            expect(sqlResult({ results: undefined }).fetchAll()).to.deep.equal([]);
            expect(sqlResult({ results: [] }).fetchAll()).to.deep.equal([]);
            expect(sqlResult({ results: [[]] }).fetchAll()).to.deep.equal([]);
        });

        it('returns an array containing the data counterpart of each item in the result-set', () => {
            const expected = ['foo', 'bar'];

            expect(sqlResult({ results: [[expected[0], expected[1]]] }).fetchAll()).to.deep.equal(expected);
        });
    });

    context('fetchOne()', () => {
        it('returns undefined when there are no items in the result-set', () => {
            /* eslint-disable no-unused-expressions */
            expect(sqlResult().fetchOne()).to.not.exist;
            expect(sqlResult({ results: undefined }).fetchOne()).to.not.exist;
            expect(sqlResult({ results: [] }).fetchOne()).to.not.exist;
            /* eslint-enable no-unused-expressions */
            return expect(sqlResult({ results: [[]] }).fetchOne()).to.not.exist;
        });

        it('returns the next available item in the result-set', () => {
            expect(sqlResult({ results: [['foo']] }).fetchOne()).to.equal('foo');
        });
    });

    context('getAffectedItemsCount()', () => {
        it('returns the same result as getAffectedRowsCount()', () => {
            expect(sqlResult({ rowsAffected: 3 }).getAffectedItemsCount()).to.equal(3);
        });
    });

    context('getAutoIncrementValue()', () => {
        it('returns the first value generated by "AUTO INCREMENT" for a given operation', () => {
            expect(sqlResult({ generatedInsertId: 1 }).getAutoIncrementValue()).to.equal(1);
        });
    });

    context('getColumns()', () => {
        it('returns the metadata for each item in the result-set wrapped as a Column instance', () => {
            const res = sqlResult({ metadata: [[{ name: 'foo' }, { name: 'bar' }]] });
            const columns = res.getColumns();

            expect(columns).to.have.lengthOf(2);
            columns.forEach(column => expect(column).to.be.an.instanceOf(Column));
        });
    });

    context('getWarnings()', () => {
        it('returns the list of warnings generated by the server for a given operation', () => {
            const warnings = ['foo', 'bar'];

            expect(sqlResult({ warnings }).getWarnings()).to.deep.equal(warnings);
        });
    });

    context('getWarningsCount()', () => {
        it('returns the number of warnings generated by the server for a given operation', () => {
            const warnings = ['foo', 'bar', 'baz'];

            expect(sqlResult({ warnings }).getWarningsCount()).to.deep.equal(3);
        });
    });

    context('hasData()', () => {
        it('returns false if the result-set does not contain any item', () => {
            // eslint-disable-next-line no-unused-expressions
            expect(sqlResult().hasData()).to.be.false;
            return expect(sqlResult({ results: [] }).hasData()).to.be.false;
        });

        it('returns true if the result-set contains items', () => {
            return expect(sqlResult({ results: [[{ data: 'foo' }]] }).hasData()).to.be.true;
        });
    });

    context('nextResult()', () => {
        it('returns false if there are no other result-sets available', () => {
            /* eslint-disable no-unused-expressions */
            expect(sqlResult().nextResult()).to.be.false;
            expect(sqlResult({ results: undefined }).nextResult()).to.be.false;
            /* eslint-enable no-unused-expressions */
            return expect(sqlResult({ results: [] }).nextResult()).to.be.false;
        });

        it('moves the cursor to the next available result-set', () => {
            const res = sqlResult({ results: [['foo'], ['bar']] });

            // eslint-disable-next-line no-unused-expressions
            expect(res.nextResult()).to.be.true;
            expect(res.fetchOne()).to.equal('bar');
        });
    });
});
